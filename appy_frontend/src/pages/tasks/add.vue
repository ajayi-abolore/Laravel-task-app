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
                                    Add New Task
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
                                            Title *
                                            <div id="ctrl-title-holder"> 
                                                <InputText  ref="ctrltitle" v-model.trim="formData.title"  label="Title" type="text" placeholder="Enter Title"      
                                                class=" w-full" :class="getErrorClass('title')">
                                                </InputText>
                                                <small v-if="isFieldValid('title')" class="p-error">{{ getFieldError('title') }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Description 
                                            <div id="ctrl-description-holder"> 
                                                <Textarea :class="getErrorClass('description')" class="w-full" ref="ctrldescription" rows="5"  v-model="formData.description" placeholder="Enter Description"    type="textarea">
                                                </Textarea>
                                                <small v-if="isFieldValid('description')" class="p-error">{{ getFieldError('description') }}</small> 
                                            </div>
                                        </div>
                                        <div class="md:col-6 col-12">
                                            Due Date 
                                            <div id="ctrl-due_date-holder"> 
                                                <Calendar  :showButtonBar="true" class="w-full" :class="getErrorClass('due_date')" dateFormat="yy-mm-dd" v-model="formData.due_date" :showIcon="true"     mask="YYYY-MM-DD"      />
                                                <small v-if="isFieldValid('due_date')" class="p-error">{{ getFieldError('due_date') }}</small> 
                                            </div>
                                        </div>
                                        <div class="md:col-6 col-12">
                                            Due Time 
                                            <div id="ctrl-due_time-holder"> 
                                                <Calendar  :showButtonBar="true" class="w-full" :class="getErrorClass('due_time')" v-model="formData.due_time"     :showTime="true" :timeOnly="true"      />
                                                <small v-if="isFieldValid('due_time')" class="p-error">{{ getFieldError('due_time') }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Status *
                                            <div id="ctrl-status-holder"> 
                                                <Dropdown  class="w-full" :class="getErrorClass('status')"      optionLabel="label" optionValue="value" ref="ctrlstatus"  v-model="formData.status" :options="app.menus.status" label="Status"  placeholder="Select a value ..." >
                                                </Dropdown> 
                                                <small v-if="isFieldValid('status')" class="p-error">{{ getFieldError('status') }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Files 
                                            <div id="ctrl-files-holder"> 
                                                <div class="mb-3">
                                                    <Uploader :class="getErrorClass('files')" upload-path="fileuploader/upload/files" v-model="formData.files" :fileLimit="5" :maxFileSize="3000000" accept=".jpg,.png,.gif,.jpeg" :multiple="false" label="Choose files or drop files here" />
                                                </div>
                                                <small v-if="isFieldValid('files')" class="p-error">{{ getFieldError('files') }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Assign To *
                                            <div id="ctrl-assign_to-holder"> 
                                                <api-data-source :enable-cache="true"   api-path="components_data/assign_to_option_list" >
                                                    <template v-slot="req">
                                                        <Dropdown @update:model-value="(val)=>assignToAutofill(val)" class="w-full" :class="getErrorClass('assign_to')"   :loading="req.loading"   optionLabel="label" optionValue="value" ref="ctrlassign_to"  v-model="formData.assign_to" :options="req.response" label="Assign To"  placeholder="Select a value ..." >
                                                        </Dropdown> 
                                                        <small v-if="isFieldValid('assign_to')" class="p-error">{{ getFieldError('assign_to') }}</small> 
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
	import { required } from 'src/services/validators';
	import { ApiService } from 'src/services/api';
	import { useApp } from 'src/composables/app.js';
	import { useAddPage } from 'src/composables/addpage.js';
	import { usePageStore } from 'src/store/page';
	const props = defineProps({
		pageStoreKey: {
			type: String,
			default: 'TASKS',
		},
		pageName : {
			type : String,
			default : 'tasks',
		},
		routeName : {
			type : String,
			default : 'tasksadd',
		},
		apiPath : {
			type : String,
			default : 'tasks/add',
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
		title: "", 
		description: "", 
		due_date: new Date(), 
		due_time: new Date(), 
		status: "pending", 
		files: "", 
		assign_to: "", 
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
			title: { required },
			description: {  },
			due_date: {  },
			due_time: {  },
			status: { required },
			files: {  },
			assign_to: { required }
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
			app.navigateTo(`/tasks`);
		}
	}
	
	const {  saving, pageReady, } = toRefs(page.state);
	
	const { submitForm, getErrorClass, getFieldError, isFieldValid,  } = page.methods;
	
	onMounted(()=>{
		const pageTitle = "Add New Task";
		app.setPageTitle(props.routeName, pageTitle); // set browser page title
	});
	
	//auto fill other inputs on assign_to change
	async function assignToAutofill(val){
		val = encodeURIComponent(val);
		const resp = await ApiService.get(`components_data/tasks_assign_to_autofill?value=${val}`);
		const data = resp.data[0];
		if(data){
		}
	}
	
	// expose page object for other components access
	defineExpose({
		page
	});
</script>
<style scoped>
</style>
