Appy Task Magement App is an assignment given to me to design a structure and develop full stack application that will automate a mini task schedule for members of team.

## Application Used:
LARAVEL - BACKEND
VUEJS – FRONTEND
MYSQL – DATABASE
PhP 8.2
AJAX
TOASTJS and e.t.c

## Installation and guidelines 
Step 1: download the two folders and one file<br>
Step 2: open your appy_backend folder and launch your php artisan migrate code<br>
Step3: import the sql file “appy_tasks_db” into the created dataset; this will enable some settings after you have migrated your database<br>
Step4: open your  vuejs  appy_frontend folder , then open .env file to change somethings<br>
Step5 : VUE_APP_API_URL = "http://localhost:8282/"
VUE_APP_API_PATH = "http://localhost:8282/api/"
    please change the url to your backend url endpoint; so that the front end can consume it<br>
STEP 6. goto auth.js in your frontend folder "\appy_frontend\src\store\auth.js" on line 5 you will seee |||| axios.defaults.baseURL =  'http://localhost:8282/api/';<br>
step7:Please change that to your endpoint url.<br>
step7:To run it, <b>npm run serve</b> not npm run dev <br>
Thank you

# Addition
there is role and permission consideration, if you register user at first it will hold him as User/Normal ;  You can go to the database ($user) and change it to 1 and see the different privildges given to admin and users

Thank you
