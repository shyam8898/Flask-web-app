-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2022 at 12:48 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datasciencehub`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Error reading data for table datasciencehub.contacts: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `datasciencehub`.`contacts`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(50) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slug` varchar(25) NOT NULL,
  `img_file` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `content`, `date`, `slug`, `img_file`) VALUES
(1, 'What is Data Science?', 'Data science is a concept to unify statistics, data analysis, informatics, and their related methods in order to understand and analyze actual phenomena with data.', 'Data science is an interdisciplinary field focused on extracting knowledge from data sets, which are typically large (see big data), and applying the knowledge and actionable insights from data to solve problems in a wide range of application domains. The field encompasses preparing data for analysis, formulating data science problems, analyzing data, developing data-driven solutions, and presenting findings to inform high-level decisions in a broad range of application domains. As such, it incorporates skills from computer science, statistics, information science, mathematics, information visualization, data sonification, data integration, graphic design, complex systems, communication and business. Statistician Nathan Yau, drawing on Ben Fry, also links data science to human-computer interaction: users should be able to intuitively control and explore data. In 2015, the American Statistical Association identified database management, statistics and machine learning, and distributed and parallel systems as the three emerging foundational professional communities.\r\n\r\nRelationship to statistics\r\nMany statisticians, including Nate Silver, have argued that data science is not a new field, but rather another name for statistics. Others argue that data science is distinct from statistics because it focuses on problems and techniques unique to digital data. Vasant Dhar writes that statistics emphasizes quantitative data and description. In contrast, data science deals with quantitative and qualitative data (e.g. images) and emphasizes prediction and action. Andrew Gelman of Columbia University has described statistics as a nonessential part of data science. Stanford professor David Donoho writes that data science is not distinguished from statistics by the size of datasets or use of computing, and that many graduate programs misleadingly advertise their analytics and statistics training as the essence of a data science program. He describes data science as an applied field growing out of traditional statistics. In summary, data science can be therefore described as an applied branch of statistics.', '2022-02-23 16:46:22', 'first-post', 'postimg.webp'),
(2, 'Machine learning', 'Machine learning (ML) is the study of computer algorithms that can improve automatically through experience and by the use of data.', 'Machine learning algorithms build a model based on sample data, known as training data, in order to make predictions or decisions without being explicitly programmed to do so. Machine learning algorithms are used in a wide variety of applications, such as in medicine, email filtering, speech recognition, and computer vision, where it is difficult or unfeasible to develop conventional algorithms to perform the needed tasks.\r\n\r\nA subset of machine learning is closely related to computational statistics, which focuses on making predictions using computers; but not all machine learning is statistical learning. The study of mathematical optimization delivers methods, theory and application domains to the field of machine learning. Data mining is a related field of study, focusing on exploratory data analysis through unsupervised learning. Some implementations of machine learning use data and neural networks in a way that mimics the working of a biological brain. In its application across business problems, machine learning is also referred to as predictive analytics.\r\n\r\nLearning algorithms work on the basis that strategies, algorithms, and inferences that worked well in the past are likely to continue working well in the future. These inferences can be obvious, such as \"since the sun rose every morning for the last 10,000 days, it will probably rise tomorrow morning as well\". They can be nuanced, such as \"X% of families have geographically separate species with color variants, so there is a Y% chance that undiscovered black swans exist\"', '2022-02-23 16:50:04', 'ml-post', 'ml.jpg'),
(3, 'Deep learning', 'Deep learning (also known as deep structured learning) is part of a broader family of machine learning methods based on artificial neural networks with representation learning.', 'Deep-learning architectures such as deep neural networks, deep belief networks, deep reinforcement learning, recurrent neural networks and convolutional neural networks have been applied to fields including computer vision, speech recognition, natural language processing, machine translation, bioinformatics, drug design, medical image analysis, climate science, material inspection and board game programs, where they have produced results comparable to and in some cases surpassing human expert performance.\r\n\r\nArtificial neural networks (ANNs) were inspired by information processing and distributed communication nodes in biological systems. ANNs have various differences from biological brains. Specifically, artificial neural networks tend to be static and symbolic, while the biological brain of most living organisms is dynamic (plastic) and analogue.\r\n\r\nThe adjective \"deep\" in deep learning refers to the use of multiple layers in the network. Early work showed that a linear perceptron cannot be a universal classifier, but that a network with a nonpolynomial activation function with one hidden layer of unbounded width can. Deep learning is a modern variation which is concerned with an unbounded number of layers of bounded size, which permits practical application and optimized implementation, while retaining theoretical universality under mild conditions. In deep learning the layers are also permitted to be heterogeneous and to deviate widely from biologically informed connectionist models, for the sake of efficiency, trainability and understandability, whence the \"structured\" part.', '2022-02-23 16:51:46', 'deep-post', 'deep.jpg'),
(4, 'Flask (web framework)', 'Flask is a micro web framework written in Python. It is classified as a microframework because it does not require particular tools or libraries.', 'Flask has no database abstraction layer, form validation, or any other components where pre-existing third-party libraries provide common functions. However, Flask supports extensions that can add application features as if they were implemented in Flask itself. Extensions exist for object-relational mappers, form validation, upload handling, various open authentication technologies and several common framework related tools.\r\n\r\nFlask was created by Armin Ronacher of Pocoo, an international group of Python enthusiasts formed in 2004. According to Ronacher, the idea was originally an April Fool\'s joke that was popular enough to make into a serious application. The name is a play on the earlier Bottle framework.\r\n\r\nWhen Ronacher and Georg Brandl created a bulletin board system written in Python in 2004, the Pocoo projects Werkzeug and Jinja were developed.\r\nIn April 2016, the Pocoo team was disbanded and development of Flask and related libraries passed to the newly formed Pallets project.\r\n\r\nFlask has become popular among Python enthusiasts. As of October 2020, it has second most stars on GitHub among Python web-development frameworks, only slightly behind Django and was voted the most popular web framework in the Python Developers Survey 2018.', '2022-02-23 16:54:31', 'flask-post', 'flask.png'),
(5, 'Natural language processing', 'Natural language processing (NLP) is a subfield of linguistics, computer science, and artificial intelligence concerned with the interactions between computers and human language', 'In particular how to program computers to process and analyze large amounts of natural language data. The goal is a computer capable of \"understanding\" the contents of documents, including the contextual nuances of the language within them. The technology can then accurately extract information and insights contained in the documents as well as categorize and organize the documents themselves.\r\n\r\nChallenges in natural language processing frequently involve speech recognition, natural language understanding, and natural language generation.\r\n\r\nNatural language processing has its roots in the 1950s. Already in 1950, Alan Turing published an article titled \"Computing Machinery and Intelligence\" which proposed what is now called the Turing test as a criterion of intelligence, though at the time that was not articulated as a problem separate from artificial intelligence. The proposed test includes a task that involves the automated interpretation and generation of natural language.', '2022-02-23 16:57:00', 'nlp-post', 'nlp.png'),
(6, 'Machine Learning Operations', 'With Machine Learning Model Operationalization Management (MLOps), we want to provide an end-to-end machine learning development process to design, build and manage reproducible, testable, and evolvable ML-powered software.', 'MLOps aims to unify the release cycle for machine learning and software application release.\r\nMLOps enables automated testing of machine learning artifacts (e.g. data validation, ML model testing, and ML model integration testing)\r\nMLOps enables the application of agile principles to machine learning projects.\r\nMLOps enables supporting machine learning models and datasets to build these models as first-class citizens within CI/CD systems.\r\nMLOps reduces technical debt across machine learning models.\r\nMLOps must be a language-, framework-, platform-, and infrastructure-agnostic practice.', '2022-02-23 16:59:21', 'mlops-post', 'mlops.png'),
(7, 'Python Object Oriented Programming', 'Python is a multi-paradigm programming language. It supports different programming approaches.', 'One of the popular approaches to solve a programming problem is by creating objects. This is known as Object-Oriented Programming (OOP).\r\n\r\nAn object has two characteristics:\r\n\r\nattributes\r\nbehavior\r\nLet\'s take an example:\r\n\r\nA parrot is an object, as it has the following properties:\r\n\r\nname, age, color as attributes\r\nsinging, dancing as behavior\r\nThe concept of OOP in Python focuses on creating reusable code. This concept is also known as DRY (Don\'t Repeat Yourself).', '2022-02-23 17:01:55', 'oops-post', 'oops.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
