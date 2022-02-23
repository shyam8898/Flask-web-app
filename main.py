from flask import Flask, render_template,url_for,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from datetime import datetime
import json
import os
from werkzeug.utils import secure_filename
import math


with open('config.json','r') as c:
   params=json.load(c)['params']

local_server=True 
app = Flask(__name__)
app.secret_key='super-secret-key'
app.config['UPLOAD_FOLDER']=params['upload_location']
app.config.update(
   MAIL_SERVER='smtp.gmail.com',
   MAIL_PORT=465,
   MAIL_USE_SSL=True,
   MAIL_USERNAME=params['gmail_user'],
   MAIL_PASSWORD=params['gmail_password']
)
mail=Mail(app)
if local_server:
       app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
       app.config['SQLALCHEMY_DATABASE_URI'] =params['prod_uri']
       
db = SQLAlchemy(app)

class contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12),nullable=False)

class posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(120), nullable=False)
    tagline = db.Column(db.String(120), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12),nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    img_file = db.Column(db.String(21), nullable=False)

@app.route('/')
def home():
       
       posts_=posts.query.filter_by().all()
       last=math.ceil(len(posts_)/int(params['no_of_posts']))
       page=request.args.get('page')
       if not str(page).isnumeric():
              page=1
       page=int(page)
       posts_=posts_[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
       # Pagination
       # First
       if page==1:
              prev="#"
              next="/?page="+str(page+1)
       elif page==last:
              prev="/?page="+str(page-1)
              next="#"
       else:
              prev="/?page="+str(page-1)
              next="/?page="+str(page+1)
       
       
       return render_template("index.html",params=params,posts=posts_,prev=prev,next=next)

@app.route('/about')
def about():
       
       return render_template("about.html",params=params)

@app.route('/dashboard',methods=['GET','POST'])
def dashboard():
       
       if 'user' in session and session['user']==params['admin_user']:
              psts=posts.query.all()
              return render_template('dashboard.html',params=params,posts=psts)
       
       if request.method=='POST':
              username=request.form.get('uname')
              passw= request.form.get('pass')
              if username==params['admin_user'] and passw==params['admin_password']:
                     session['user']=username
                     psts=posts.query.all()
                     return render_template('dashboard.html',params=params,posts=psts)
              else:
                     return render_template("login.html",params=params)
       else:
              return render_template("login.html",params=params)

@app.route('/edit/<string:sno>',methods=['GET','POST'])
def edit(sno):
       if 'user' in session and session['user']==params['admin_user']:
              if request.method=='POST':
                     box_title=request.form.get('title')
                     tagline=request.form.get('tagline')
                     slug=request.form.get('slug')
                     content=request.form.get('content')
                     img_file=request.form.get('img_file')
                     date=datetime.now()
                     
                     if sno=='0':
                            psts=posts(title=box_title,tagline=tagline,content=content,date=date,slug=slug,img_file=img_file)
                            db.session.add(psts)
                            db.session.commit()
                     else:
                            psts=posts.query.filter_by(sno=sno).first()
                            psts.title=box_title
                            psts.tagline=tagline
                            psts.content=content
                            psts.date=date
                            psts.slug=slug
                            psts.img_file=img_file
                            db.session.commit()
                            return redirect('/edit/'+sno)
              pts=posts.query.filter_by(sno=sno).first()            
              return render_template('edit.html',params=params,post=pts,sno=sno)
  
@app.route('/uploader',methods=['GET','POST'])
def uploader():
       if 'user' in session and session['user']==params['admin_user']:
              if request.method=='POST':
                     f=request.files['file1']
                     f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
                     return "Uploaded Successfully"

@app.route('/logout')
def logout():
       session.pop('user')
       return redirect('/dashboard')

@app.route('/delete/<string:sno>',methods=['GET','POST'])
def delete(sno):
       if 'user' in session and session['user']==params['admin_user']:
              psts=posts.query.filter_by(sno=sno).first()
              db.session.delete(psts)
              db.session.commit()
       return redirect('/dashboard')

@app.route('/contact',methods=['GET','POST'])
def contact():
    if request.method=='POST':
        
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        message=request.form.get('message')
        
        entry=contacts(name=name,email=email,phone_num=phone,msg=message,date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New Message From ' + name,
                          sender=email,
                          recipients=[params['gmail_user']],
                          body=message + '\n' + phone
                          )
        
    return render_template("contact.html",params=params)

@app.route('/post/<string:post_slug>',methods=['GET'])
def post_route(post_slug):
       post=posts.query.filter_by(slug=post_slug).first()
       
       return render_template("post.html",params=params,post=post)

if __name__ == '__main__':
   app.run(debug = True)

