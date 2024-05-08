
import { createRouter, createWebHashHistory } from 'vue-router';

import { useAuth } from 'src/composables/auth';


function passRouteToProps(route){
	return {
		queryParams: route.query,
		fieldName: route.params.fieldName, 
		fieldValue: route.params.fieldValue
	}
}


let routes = [
	//Dashboard routes


//permissions routes
			{
				path: '/permissions/:fieldName?/:fieldValue?',
				name: 'permissionslist',
				component: () => import('./pages/permissions/list.vue'), 
				props: route => passRouteToProps(route)
			},
	
			{ 
				path: '/permissions/view/:id', 
				name: 'permissionsview', 
				component: () => import('./pages/permissions/view.vue'), 
				props: true
			},
		
			{ 
				path: '/permissions/add', 
				name: 'permissionsadd', 
				component: () => import('./pages/permissions/add.vue'), 
				props: true
			},
	
			{ 
				path: '/permissions/edit/:id', 
				name: 'permissionsedit', 
				component: () => import('./pages/permissions/edit.vue'), 
				props: true
			},
		

//roles routes
			{
				path: '/roles/:fieldName?/:fieldValue?',
				name: 'roleslist',
				component: () => import('./pages/roles/list.vue'), 
				props: route => passRouteToProps(route)
			},
	
			{ 
				path: '/roles/view/:id', 
				name: 'rolesview', 
				component: () => import('./pages/roles/view.vue'), 
				props: true
			},
		
			{ 
				path: '/roles/add', 
				name: 'rolesadd', 
				component: () => import('./pages/roles/add.vue'), 
				props: true
			},
	
			{ 
				path: '/roles/edit/:id', 
				name: 'rolesedit', 
				component: () => import('./pages/roles/edit.vue'), 
				props: true
			},
		

//tasks routes
			{
				path: '/tasks/:fieldName?/:fieldValue?',
				name: 'taskslist',
				component: () => import('./pages/tasks/list.vue'), 
				props: route => passRouteToProps(route)
			},
	
			{ 
				path: '/tasks/view/:id', 
				name: 'tasksview', 
				component: () => import('./pages/tasks/view.vue'), 
				props: true
			},
		
			{ 
				path: '/tasks/add', 
				name: 'tasksadd', 
				component: () => import('./pages/tasks/add.vue'), 
				props: true
			},
	
			{ 
				path: '/tasks/edit/:id', 
				name: 'tasksedit', 
				component: () => import('./pages/tasks/edit.vue'), 
				props: true
			},
		

//users routes
			{
				path: '/users/:fieldName?/:fieldValue?',
				name: 'userslist',
				component: () => import('./pages/users/list.vue'), 
				props: route => passRouteToProps(route)
			},
	
			{ 
				path: '/users/view/:id', 
				name: 'usersview', 
				component: () => import('./pages/users/view.vue'), 
				props: true
			},
		
			{ 
				path: '/index/register', 
				name: 'usersuserregister', 
				component: () => import('./pages/index/userregister.vue'), 
				props: true
			},
	
			{ 
				path: '/account/edit', 
				name: 'usersaccountedit', 
				component: () => import('./pages/account/accountedit.vue'), 
				props: true
			},
	
			{ 
				path: '/account', 
				name: 'usersaccountview', 
				component: () => import('./pages/account/accountview.vue'), 
				props: true
			},
	
			{ 
				path: '/users/add', 
				name: 'usersadd', 
				component: () => import('./pages/users/add.vue'), 
				props: true
			},
	
			{ 
				path: '/users/edit/:id', 
				name: 'usersedit', 
				component: () => import('./pages/users/edit.vue'), 
				props: true
			},
		

	
	
//Password reset routes
			{ 
				path: '/index/forgotpassword', 
				name: 'forgotpassword', 
				component: () => import('./pages/index/forgotpassword.vue'), 
				props: true
			},
			{ 
				path: '/index/resetpassword', 
				name: 'resetpassword', 
				component: () => import('./pages/index/resetpassword.vue'), 
				props: true
			},
			{ 
				path: '/index/resetpassword_completed', 
				name: 'resetpassword_completed', 
				component: () => import('./pages/index/resetpassword_completed.vue'), 
				props: true
			},
	
	
	
	{ 
		path:  '/error/forbidden', 
		name: 'forbidden', 
		component: () => import('./pages/errors/forbidden.vue'),
		props: true
	},
	{ 
		path: '/error/notfound', 
		name: 'notfound',
		component: () => import('./pages/errors/pagenotfound.vue'),
		props: true
	},
	{
		path: '/:catchAll(.*)', 
		component: () => import('./pages/errors/pagenotfound.vue')
	}
];

export default () => {
	
const auth = useAuth();

	
	const user = auth.user;
	if(user){
		routes.push({ path: '/', alias: '/home', name: 'home', component: () => import(`./pages/home/home.vue`) });
	}
	else{
		routes.push({ path: '/', alias: '/index', name: 'index', component: () => import('./pages/index/index.vue') });
	}

	const router = createRouter({
		history: createWebHashHistory(),
		routes,
		scrollBehavior(to, from, savedPostion){
			if(savedPostion) return savedPostion;
			return { top:0 }
		}
	});
	
	router.beforeEach((to, from, next) => {
		const user = auth.user;
		let path = to.path;
		let authRequired = auth.pageRequiredAuth(path);
		if (authRequired) {
			if(!user){
				return next({ path: '/',  query: { nexturl: to.fullPath } });
			}
			//authorize user
			if (!auth.canView(path)) {
				return next({path: "/error/forbidden"});
			}
		}

		if(user && to.name == "index"){
			//already logged in, show home when try to access index page
			return next({ path: "/home"});
		}

		//navigate to redirect url if available
		if(to.name == "home" && to.query.nexturl){
			return next({ path: to.query.nexturl});
		}

 		//close dialog from previous page
		//store.closeDialogs('app/closeDialogs');
		
		next();
	});

	return router;
}
