# Exhibition Management System (DBMS Project)

## 📌 Overview  

The **Exhibition Management System (EMS)** is a **DBMS mini project** designed to manage exhibitions at a single venue.  
It provides a structured, database-driven workflow for three key roles:  

- 👥 **Customers** → Register, log in, and purchase tickets.  
- 🎨 **Artists** → Register, pay participation fees, and add artworks.  
- 🛠️ **Administrators** → Manage exhibitions, tickets, employees, and finances.  

✨ This project replaces manual processes with an integrated **MySQL database system**.

---
```
Exhibition-Management-System/
├── README.md
├── report/
│ ├── user_requirements.pdf
│ └── schema_and_er_model.pdf
├── database/
│ ├── ems_schema.sql # Database schema with tables & constraints
│ ├── queries.sql # Requirement-based queries
│ ├── triggers.sql # Business rule triggers
│ ├── procedures.sql # Stored procedures (SPs)
│ ├── functions.sql # User-defined functions (UDFs)
│ ├── views.sql # Database views
│ └── sample_data.sql # Sample data for testing
└── docs/
├── ER_Diagram.png
└── Schema_Diagram.png
```
---

## 📑 Reports
- [User Requirements](report/user_requirements.pdf)  
- [Schema & ER Model](report/schema_and_er_model.pdf)  

---

## 🗄️ Database Files
- ✅ **[ems_schema.sql](database/ems_schema.sql)** → Defines tables, keys, and constraints.  
- ✅ **[queries.sql](database/queries.sql)** → Requirement-driven SQL queries for customers, artists, and admins.  
- 🚧 **triggers.sql** → *(Upcoming)* Triggers for enforcing business rules (e.g., ticket validation, employee auto-fill).  
- 🚧 **procedures.sql** → *(Upcoming)* Stored procedures for modular DB logic.  
- 🚧 **functions.sql** → *(Upcoming)* User-defined functions (UDFs).  
- 🚧 **views.sql** → *(Upcoming)* Database views for simplified data access.  
- 🚧 **sample_data.sql** → *(Upcoming)* Sample test data for validation.  

## 📊 ER & Schema Diagrams
![ER Diagram](docs/ER_Diagram.png)  
![Schema Diagram](docs/Schema_Diagram.png)  

---

## ⚙️ Tools & Technologies
- **Database**: MySQL  
- **Frontend**: (Planned: HTML, CSS, JS)  
- **Backend**: (Planned: PHP / Flask / Node.js)  
- **IDE**: VS Code  
- **Testing**: MySQL Workbench / CLI  

---

## 🚀 How to Run
1. Clone this repo:
   ```bash
   git clone https://github.com/<your-username>/Exhibition-Management-System.git
   cd Exhibition-Management-System
### Import schema:
```bash
mysql -u root -p < database/ems_schema.sql
```

### Load sample data (optional):
```bash
mysql -u root -p < database/sample_data.sql
```

### Run queries:
```bash 
mysql -u root -p < database/queries.sql
```
(Note: ⚠️Other DB components (triggers, SPs, UDFs, views, and sample data) will be added soon..)

## 👩‍💻 Future Scope
✅ **Phase 1 (Completed):** Database schema & requirement queries.  
- 🛠️ **Phase 1.1 (In Progress):** Triggers, SPs, UDFs, views, and sample data.  
- 🔜 **Phase 2 (2–3 months):** Add UI (customer/artist/admin dashboards).  
- 🔜 **Phase 3:** Extend for multi-venue exhibition management.  
- 🔜 **Phase 4:** Add analytics & reporting dashboards.  

---

## ✨ Contributors
- **Deepthi M (PES1UG23AM092)**
- **Samrudhi Rao (PES1UG23AM915)**

