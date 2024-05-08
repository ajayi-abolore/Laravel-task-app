
export const AppMenus = {
    
	navbarTopRight: [],
	navbarTopLeft: [],
	navbarSideLeft: [
  {
    "to": "/home",
    "label": "Home",
    "icon": "pi pi-th-large",
    "iconcolor": "",
    "target": "",
    
  },
  {
    "to": "/tasks",
    "label": "Tasks",
    "icon": "pi pi-th-large",
    "iconcolor": "",
    "target": "",
    
  },
  {
    "to": "/users",
    "label": "Users",
    "icon": "pi pi-th-large",
    "iconcolor": "",
    "target": "",
    
  }
],
	status: [    
{value: "pending", label: "pending"},
	{value: "completed", label: "completed"},
	{value: "in_progress", label: "in_progress"},
	{value: "abandon", label: "abandon"}
    ],
	isActive: [    
{value: "yes", label: "yes"},
	{value: "no", label: "no"}
    ],
	userType: [    
{value: "normal", label: "normal"},
	{value: "admin", label: "admin"}
    ],

    exportFormats: {
        print: {
			label: 'Print',
            icon: 'pi pi-print',
            type: 'print',
            ext: 'print',
        },
        pdf: {
			label: 'Pdf',
			
            icon: 'pi pi-file-pdf',
            type: 'pdf',
            ext: 'pdf',
        },
        excel: {
			label: 'Excel',
            icon: 'pi pi-file-excel',
            type: 'excel',
            ext: 'xlsx',
        },
        csv: {
			label: 'Csv',
            icon: 'pi pi-table',
            type: 'csv',
            ext: 'csv',
        },
    },
    
}