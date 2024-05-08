<?php

use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
// api routes that need auth

Route::middleware(['auth:api', 'rbac'])->group(function () {


	/* routes for Permissions Controller  */
	Route::get('permissions/', 'PermissionsController@index');
	Route::get('permissions/index', 'PermissionsController@index');
	Route::get('permissions/index/{filter?}/{filtervalue?}', 'PermissionsController@index');
	Route::get('permissions/view/{rec_id}', 'PermissionsController@view');
	Route::post('permissions/add', 'PermissionsController@add');
	Route::any('permissions/edit/{rec_id}', 'PermissionsController@edit');
	Route::any('permissions/delete/{rec_id}', 'PermissionsController@delete');

	/* routes for Roles Controller  */
	Route::get('roles/', 'RolesController@index');
	Route::get('roles/index', 'RolesController@index');
	Route::get('roles/index/{filter?}/{filtervalue?}', 'RolesController@index');
	Route::get('roles/view/{rec_id}', 'RolesController@view');
	Route::post('roles/add', 'RolesController@add');
	Route::any('roles/edit/{rec_id}', 'RolesController@edit');
	Route::any('roles/delete/{rec_id}', 'RolesController@delete');

	/* routes for Tasks Controller  */
	Route::get('tasks/', 'TasksController@index');
	Route::get('tasks/index', 'TasksController@index');
	Route::get('tasks/index/{filter?}/{filtervalue?}', 'TasksController@index');
	Route::get('tasks/view/{rec_id}', 'TasksController@view');
	Route::post('tasks/add', 'TasksController@add');
	Route::any('tasks/edit/{rec_id}', 'TasksController@edit');
	Route::any('tasks/delete/{rec_id}', 'TasksController@delete');

	/* routes for Users Controller  */


	Route::get('users/', 'UsersController@index');
	Route::get('users/index', 'UsersController@index');
	Route::get('users/index/{filter?}/{filtervalue?}', 'UsersController@index');
	Route::get('users/view/{rec_id}', 'UsersController@view');
	Route::any('account/edit', 'AccountController@edit');
	Route::get('account', 'AccountController@index');
	Route::post('account/changepassword', 'AccountController@changepassword');
	Route::get('account/currentuserdata', 'AccountController@currentuserdata');
	Route::post('users/add', 'UsersController@add');
	Route::any('users/edit/{rec_id}', 'UsersController@edit');
	Route::any('users/delete/{rec_id}', 'UsersController@delete');
});

Route::get('home', 'HomeController@index');

Route::post('auth/register', 'AuthController@register');
Route::post('auth/login', 'AuthController@login');
Route::get('login', 'AuthController@login')->name('login');

Route::post('auth/forgotpassword', 'AuthController@forgotpassword')->name('password.reset');
Route::post('auth/resetpassword', 'AuthController@resetpassword');

Route::get('components_data/role_id_option_list/{arg1?}', 'Components_dataController@role_id_option_list');
Route::get('components_data/assign_to_option_list/{arg1?}', 'Components_dataController@assign_to_option_list');
Route::get('components_data/tasks_assign_to_autofill/{arg1?}', 'Components_dataController@tasks_assign_to_autofill');
Route::get('components_data/users_name_exist/{arg1?}', 'Components_dataController@users_name_exist');
Route::get('components_data/users_email_exist/{arg1?}', 'Components_dataController@users_email_exist');


/* routes for FileUpload Controller  */
Route::post('fileuploader/upload/{fieldname}', 'FileUploaderController@upload');
Route::post('fileuploader/s3upload/{fieldname}', 'FileUploaderController@s3upload');
Route::post('fileuploader/remove_temp_file', 'FileUploaderController@remove_temp_file');
