<template>
    <main class="main-page"  id="">
        <template v-if="pageReady">
            <section class="page-section " >
                <div class="container">
                    <div class="grid ">
                        <div  class="md:col-9 sm:col-12 comp-grid" >
                            <div >
                                <form ref="observer"  tag="form" @submit.prevent="submitForm()" :class="{ 'card ': !isSubPage }" class=" ">
                                    <!--[form-content-start]-->
                                    <div class="grid">
                                        <div class="col-12">
                                            Name *
                                            <div id="ctrl-name-holder"> 
                                                <InputText  ref="ctrlname" v-model.trim="formData.name"  label="Name" type="text" placeholder="Enter Name"      
                                                class=" w-full" :class="getErrorClass('name')">
                                                </InputText>
                                                <small v-if="isFieldValid('name')" class="p-error">{{ getFieldError('name') }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Is Active *
                                            <div id="ctrl-is_active-holder"> 
                                                <Dropdown  class="w-full" :class="getErrorClass('is_active')"      optionLabel="label" optionValue="value" ref="ctrlis_active"  v-model="formData.is_active" :options="app.menus.isActive" label="Is Active"  placeholder="Select a value ..." >
                                                </Dropdown> 
                                                <small v-if="isFieldValid('is_active')" class="p-error">{{ getFieldError('is_active') }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            User Type *
                                            <div id="ctrl-user_type-holder"> 
                                                <Dropdown  class="w-full" :class="getErrorClass('user_type')"      optionLabel="label" optionValue="value" ref="ctrluser_type"  v-model="formData.user_type" :options="app.menus.userType" label="User Type"  placeholder="Select a value ..." >
                                                </Dropdown> 
                                                <small v-if="isFieldValid('user_type')" class="p-error">{{ getFieldError('user_type') }}</small> 
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
                                    <!--[form-content-end]-->
                                    <div v-if="showSubmitButton" class="text-center my-3">
                                        <Button type="submit" label="Update" icon="pi pi-send" :loading="saving" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </template>
        <template v-if="loading">
            <div style="min-height:200px" class="flex gap-3 justify-content-center align-items-center p-3">
                <div><ProgressSpinner style="width:50px;height:50px" /> </div>
                <div class="text-500">Loading... </div>
            </div>
        </template>
    </main>
</template>
<script setup>
	import {  computed,  reactive, toRefs, onMounted } from 'vue';
	import { required } from 'src/services/validators';
	import { useApp } from 'src/composables/app.js';
	import { useEditPage } from 'src/composables/editpage.js';
	import { usePageStore } from 'src/store/page';
	const props = defineProps({
		id: [String, Number],
		pageStoreKey: {
			type: String,
			default: 'ACCOUNT',
		},
		pageName: {
			type: String,
			default: 'users',
		},
		routeName: {
			type: String,
			default: 'usersaccountedit',
		},
		pagePath: {
			type : String,
			default : 'account/edit',
		},
		apiPath: {
			type: String,
			default: 'account/edit',
		},
		submitButtonLabel: {
			type: String,
			default: "Update",
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
			default: "Update Record",
		},
		msgBeforeSave: {
			type: String,
			default: "",
		},
		msgAfterSave: {
			type: String,
			default: "Record updated successfully",
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
	});
	
	const store = usePageStore(props.pageStoreKey);
	const app = useApp();
	
	const formDefaultValues = Object.assign({
		name: "", 
		is_active: "", 
		user_type: "", 
		user_role_id: "", 
	}, props.pageData);
	
	const formData = reactive({ ...formDefaultValues });
	
	function afterSubmit(response) {
		app.flashMsg(props.msgTitle, props.msgAfterSave);
		location.reload();
	}
	
	// form validation rules
	const rules = computed(() => {
		return {
			name: { required },
			is_active: { required },
			user_type: { required },
			user_role_id: {  }
		}
	});
	
	const page = useEditPage({store, props, formData, rules, afterSubmit });
	
	const {  currentRecord: editRecord } = toRefs(store.state);
	const {  pageReady, saving, loading, } = toRefs(page.state);
	
	const { apiUrl } = page.computedProps;
	
	const { load, submitForm, getErrorClass, getFieldError, isFieldValid,  } = page.methods;
	
	onMounted(()=>{
		const pageTitle = "My Account";
		app.setPageTitle(props.routeName, pageTitle); // set browser page title
	});
</script>
<style scoped>
</style>
