# Welcome to My Basecamp 2

MyBaseCamp2 (A continuation of MyBaseCamp1) is a web-based project management tool developed using Ruby on Rails framework. It allows users to:

* create and manage projects, 
* create and manage attachments for each project, 
* view threads under each project, and
* creates and manages messages under each thread.

NOTE: Only admin's are allowed to create and manage threads.

## DEPLOYMENT URL

* My BaseCamp 2 url: https://my-basecamp2.fly.dev/

## Task
* Features User Registration Users can create, view, and delete their accounts.
* Session Users can log in and log out of their accounts.
* Role Permission Admin privileges can be granted or removed by an existing admin user.

* Users can create, view, edit, and delete:

* * projects,
* * messages within each thread,
* * view threads within each project, and
* * create, view and delete attachments within each projects.

NOTE: Only Admins can create, edit and delete threads.

## Description
Users can create, view, edit, and delete:

* projects,
* messages within each thread,
* view threads within each project, and
* create, view and delete attachments within each projects.

NOTE: Only Admins can create, edit and delete threads.

## Installation
* Install Ruby on Rails framework.
* Clone the repository. 
* Navigate to the project directory and install the required gems. 
* Run the server.

## Usage
* How to Set First Admin User from console

* * rails console
* * user = User.find(1)
* * user.admin = true
* * user.save

NOTE: after admin is set subsequent users can be set from edit on admin panel or from the sign-up page.

* To run server:

* * bundle install
* * rails db:migrate
* * rails server

* OR

* * https://my-basecamp2.fly.dev/
* * Sign in to the above url as an admin with:
* * * Username: sophieright@gmail.com
* * * Password: right123

### The Core Team
./my_project  Right Sophia Praise

<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px'></span>
