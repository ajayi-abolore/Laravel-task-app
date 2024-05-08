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
                                    Edit Task
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
                                <form ref="observer"  tag="form" @submit.prevent="submitForm()" :class="{ 'card ': !isSubPage }" class=" ">
                                    <!--[form-content-start]-->
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
                                                    <Uploader :class="getErrorClass('files')" :auto="true" :fileLimit="5" :maxFileSize="3000000" accept=".jpg,.png,.gif,.jpeg" :multiple="false" style="width:100%" label="Choose files or drop files here" upload-path="fileuploader/upload/files" v-model="formData.files"></Uploader>
                                                </div>
                                                <small v-if="isFieldValid('files')" class="p-error">{{ getFieldError('files') }}</small> 
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            Assign To *
                                            <div id="ctrl-assign_to-holder"> 
                                                <api-data-source :enable-cache="true"   api-path="components_data/assign_to_option_list" >
                                                    <template v-slot="req">
                                                        <Dropdown  class="w-full" :class="getErrorClass('assign_to')"   :loading="req.loading"   optionLabel="label" optionValue="value" ref="ctrlassign_to"  v-model="formData.assign_to" :options="req.response" label="Assign To"  placeholder="Select a value ..." >
                                                        </Dropdown> 
                                                        <small v-if="isFieldValid('assign_to')" class="p-error">{{ getFieldError('assign_to') }}</small> 
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
			default: 'TASKS',
		},
		pageName: {
			type: String,
			default: 'tasks',
		},
		routeName: {
			type: String,
			default: 'tasksedit',
		},
		pagePath: {
			type : String,
			default : 'tasks/edit',
		},
		apiPath: {
			type: String,
			default: 'tasks/edit',
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
		title: "", 
		description: "", 
		due_date: new Date(), 
		due_time: new Date(), 
		status: "pending", 
		files: "", 
		assign_to: "", 
	}, props.pageData);
	
	const formData = reactive({ ...formDefaultValues });
	
	function afterSubmit(response) {
		app.flashMsg(props.msgTitle, props.msgAfterSave);
		if(app.isDialogOpen()){
			app.closeDialogs(); // if page is open as dialog, close dialog
		}
		else if(props.redirect) {
			app.navigateTo(`/tasks`);
		}
	}
	
	// form validation rules
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
	
	const page = useEditPage({store, props, formData, rules, afterSubmit });
	
	const {  currentRecord: editRecord } = toRefs(store.state);
	const {  pageReady, saving, loading, } = toRefs(page.state);
	
	const { apiUrl } = page.computedProps;
	
	const { load, submitForm, getErrorClass, getFieldError, isFieldValid,  } = page.methods;
	
	onMounted(()=>{
		const pageTitle = "Edit Task";
		app.setPageTitle(props.routeName, pageTitle); // set browser page title
	});
</script>
<style scoped>
</style>
