use SkillBeeDB;

select * from registration

create table adminLogin
(
  AdminId int identity(1,1) not null,
  AdminUserID varchar(20) not null,
  Pass varchar(20) not null
);

select * from adminLogin;

insert into adminLogin values ('spark', 'andromida');

select * from feedBack;

select count(AdminId) from adminLogin where AdminUserID = 'spark' and Pass ='andromida';

SELECT * FROM SkillBeeDB.INFORMATION_SCHEMA.Tables

create table topics 
(
  TopicID		int identity(1,1)	not null,
  Topic			varchar(30)			not null,
  display		int					not null   default 0,
  TopicPageID	varchar(30)			not null
);

insert into topics values('Database Management',1,'db');



create table subTopics
(
	SubTopicID		int identity(1,1)	not null,
	TopicID			int					not null,
	SubTopicHeading	varchar(30)			not null,
	SubTopicImg		varchar(50)			not null,
	Display			int					not null  default 0
);

select * from topics;
select * from subTopics;
select SubTopicHeading from subTopics where SubTopicID=1017

delete from topics where TopicID=1;

truncate table questions

update topics set Topic='MSO', display=1, TopicPageID='msso' where TopicID=7;

insert into subTopics values(1,'gg','ff',1);

select TopicID, Topic from topics

update subTopics set TopicID=2, SubTopicHeading='Java' , SubTopicImg='~/c/c.png' , Display=1 where SubTopicID = 6 

create table challenges(
ChallengesID	int identity(1,1) not null,
SubTopicID		int not null,
Heading1		nvarchar(100) not null,
Heading2		nvarchar(100) not null,
Display			int not null
);

select ChallengesID , Heading1, Heading2 from challenges

select ChallengesID , Heading1+' '+Heading2 as Heading from challenges

insert into challenges values(1013,'Java','Easy',1);
insert into challenges values(1014,'Java','Easy',1);
select * from challenges 


select SubTopicID, SubTopicHeading from subTopics

select SubTopicHeading from  SubTopics 

update challenges set SubTopicID=@SubTopicID, Heading1=@Heading1, Heading2=@Heading2 ,Display=@Display where  ChallengesID=@Challenge

drop table questions

create table questions(
QuesID int identity(1,1) not null,
ChallengesID int not null,
Ques nvarchar(max) not null,
Ans1 nvarchar(max) not  null,
Ans2 nvarchar(max) not  null,
Ans3 nvarchar(max) not  null,
Ans4 nvarchar(max) not  null,
CorrectAns int not null
);

select * from questions
select * from challenges 

truncate table questions

insert into questions values(3,'Q1','A1','A2','A3','A4',4);
insert into questions values(3,'Q2','A1','A2','A3','A4',3);
insert into questions values(3,'Q3','A1','A2','A3','A4',1);
insert into questions values(3,'Q4','A1','A2','A3','A4',4);
insert into questions values(4,'Q1','A1','A2','A3','A4',2);
insert into questions values(4,'Q2','A1','A2','A3','A4',1);
insert into questions values(4,'Q3','A1','A2','A3','A4',3);
insert into questions values(4,'Q4','A1','A2','A3','A4',4);

select * from topics,subTopics

create table results(
UserID int not null,
ChallengeID int not null,
MaxMarks int not null,
ObtainMarks int not null
);

select * from results

select UserId from registration where Email='spark@gmail.com' and Password='andromida'
select * from Results where UserID=3

create table merit(
UserID int not null,
UserRank int not null,
Percentage float not null 
);

select * from merit

select count(*) from results where UserID=3 and ChallengeID=10

delete from results where UserID=3 and ChallengeID=10
