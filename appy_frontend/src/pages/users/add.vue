<template>
    <main class="main-page"  id="">
        <template v-if="pageReady">
            <template v-if="showHeader">
                <section class="page-section mb-3" >
                    <div class="container">
                        <div class="grid justify-content-between align-items-center">
                            <div  v-if="!isSubPage"  class="col-fixed " >
                                <Button @click="$router.go(-1)" label=""  class="p-button p-button-text " icon="pi pi-arrow-left"  />
                            </div>
                            <div  class="col " >
                                <div class=" text-2xl text-primary font-bold" >
                                    Add New User
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </section>
            </template>
            <section class="page-section " >
                <div class="container">
                    <div class="grid ">
                        <div  class="md:col-9 sm:col-12 comp-grid" >
                            <div >
                                <form ref="observer" tag="form" @submit.prevent="submitForm()" :class="{ 'card ': !isSubPage }" class=" ">
                                    <div class="grid">
                                        <div class="col-12">
                                            Name *
                                            <div id="ctrl-name-holder"> 
                                                <check-duplicate v-model="formData.name" check-path="components_data/users_name_exist/" v-slot="checker">
                                                <InputText  ref="ctrlname" @blur="checker.check" :loading="checker.loading" v-model.trim="formData.name"  label="Name" type="text" placeholder="Enter Name"      
                                                class=" w-full" :class="getErrorClass('name')">
                                                </InputText>
                                                <small v-if="isFieldValid('name')" class="p-error">{{ getFieldError('name') }}</small> 
                                                <small v-if="!checker.loading && checker.exist" class="p-error"> Not available</small>
                                                <small v-if="checker.loading" class="text-500">Checking...</small>
                                                </check-duplicate>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Email *
                                            <div id="ctrl-email-holder"> 
                                                <check-duplicate v-model="formData.email" check-path="components_data/users_email_exist/" v-slot="checker">
                                                <InputText  ref="ctrlemail" @blur="checker.check" :loading="checker.loading" v-model.trim="formData.email"  label="Email" type="email" placeholder="Enter Email"      
                                                class=" w-full" :class="getErrorClass('email')">
                                                </InputText>
                                                <small v-if="isFieldValid('email')" class="p-error">{{ getFieldError('email') }}</small> 
                                                <small v-if="!checker.loading && checker.exist" class="p-error"> Not available</small>
                                                <small v-if="checker.loading" class="text-500">Checking...</small>
                                                </check-duplicate>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Password *
                                            <div id="ctrl-password-holder"> 
                                                <Password ref="ctrlpassword" v-model="formData.password" label="Password" placeholder="Enter Password"   
                                                class="w-full" inputClass="w-full" toggleMask :feedback="true" :class="getErrorClass('password')" />
                                                <small v-if="isFieldValid('password')" class="p-error">{{ getFieldError('password') }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Confirm Password *
                                            <div id="ctrl-password-holder"> 
                                                <Password  class="w-full" :class="getErrorClass('confirm_password', row)" inputClass="w-full" :feedback="false" toggleMask ref="ctrlconfirmpassword" v-model="formData.confirm_password" label="Confirm Password" placeholder="Confirm Password"  />
                                                <small v-if="isFieldValid('confirm_password', row)" class="p-error">{{ getFieldError('confirm_password', row) }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            User Role Id 
                                            <div id="ctrl-user_role_id-holder"> 
                                                <api-data-source :enable-cache="true"   api-path="components_data/role_id_option_list" >
                                                    <template v-slot="req">
                                                        <Dropdown  class="w-full" :class="getErrorClass('user_role_id')"   :loading="req.loading"   optionLabel="label" optionValue="value" ref="ctrluser_role_id"  v-model="formData.user_role_id" :options="req.response" label="User Role Id"  placeholder="Select a value ..." >
                                                        </Dropdown> 
                                                        <small v-if="isFieldValid('user_role_id')" class="p-error">{{ getFieldError('user_role_id') }}</small> 
                                                    </template>
                                                </api-data-source>
                                            </div>
                                        </div>
                                    </div>
                                    <div v-if="showSubmitButton" class="text-center my-3">
                                        <Button class="p-button-primary" type="submit" label="Submit" icon="pi pi-send" :loading="saving" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </template>
    </main>
</template>
<script setup>
	import {  computed,  reactive, toRefs, onMounted } from 'vue';
	import { required, email, sameAs, } from 'src/services/validators';
	import { useApp } from 'src/composables/app.js';
	import { useAddPage } from 'src/composables/addpage.js';
	import { usePageStore } from 'src/store/page';
	const props = defineProps({
		pageStoreKey: {
			type: String,
			default: 'USERS',
		},
		pageName : {
			type : String,
			default : 'users',
		},
		routeName : {
			type : String,
			default : 'usersadd',
		},
		apiPath : {
			type : String,
			default : 'users/add',
		},
		submitButtonLabel: {
			type: String,
			default: "Submit",
		},
		formValidationError: {
			type: String,
			default: "Form is invalid",
		},
		formValidationMsg: {
			type: String,
			default: "Please complete the form",
		},
		msgTitle: {
			type: String,
			default: "Create Record",
		},
		msgAfterSave: {
			type: String,
			default: "Record added successfully",
		},
		msgBeforeSave: {
			type: String,
			default: "",
		},
		showHeader: {
			type: Boolean,
			default: true,
		},
		showSubmitButton: {
			type: Boolean,
			default: true,
		},
		redirect: {
			type : Boolean,
			default : true,
		},
		isSubPage: {
			type : Boolean,
			default : false,
		},
		pageData: { // use to set formData default values from another page
			type: Object,
			default: () => ({
		name: "", 
		email: "", 
		password: "", 
		confirm_password: "", 
		user_role_id: "", 
			})
		},
	});
	//lines
	const store = usePageStore(props.pageStoreKey);
	const app = useApp();
	
	const formData = reactive({ ...props.pageData });
	
	//vuelidate form validation rules
	const rules = computed(() => {
		return {
			name: { required },
			email: { required, email },
			password: { required },
			confirm_password: {required, sameAs: sameAs(formData.password, 'Password') },
			user_role_id: {  }
		}
	});
	
	const page = useAddPage({ store, props, formData, rules, beforeSubmit, afterSubmit });
	
	// event raised before submit form
	function beforeSubmit(){
		return true;
	}
	
	// event raised after form submited
	function afterSubmit(response) { 
		app.flashMsg(props.msgTitle, props.msgAfterSave);
		page.setFormDefaultValues(); //reset form data
		if(app.isDialogOpen()){
			app.closeDialogs(); // if page is open as dialog, close dialog
		}
		else if(props.redirect) {
			app.navigateTo(`/users`);
		}
	}
	
	const {  saving, pageReady, } = toRefs(page.state);
	
	const { submitForm, getErrorClass, getFieldError, isFieldValid,  } = page.methods;
	
	onMounted(()=>{
		const pageTitle = "Add New User";
		app.setPageTitle(props.routeName, pageTitle); // set browser page title
	});
	
	// expose page object for other components access
	defineExpose({
		page
	});
</script>
<style scoped>
</style>
