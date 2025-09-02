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
## 📂 Repository Structure
Exhibition-Management-System/
├── README.md
├── report/
│ ├── user_requirements.pdf
│ └── schema_and_er_model.pdf
├── database/
│ ├── ems_schema.sql # Database schema with tables & constraints
│ ├── queries.sql # Requirement-based queries
│ └── triggers.sql # Business rule triggers (if added)
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
- **[ems_schema.sql](database/ems_schema.sql)** → Defines tables, keys, and constraints.  
- **[queries.sql](database/queries.sql)** → Queries for customers, artists, admins, and frontend-driven use cases.  
- **[triggers.sql](database/triggers.sql)** → (Optional) Triggers for business logic like employee auto-fill and ticket validation.  

---

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
Import schema:

bash
Copy code
mysql -u root -p < database/ems_schema.sql
Run queries:

bash
Copy code
mysql -u root -p < database/queries.sql
(Note: sample_data.sql will be added later for testing.)

## 👩‍💻 Future Scope
- Add UI for customers, artists, and admins.
- Implement backend logic to connect UI ↔ DB.
- Extend for multi-venue exhibition management.
- Add advanced analytics & reports.

---

## ✨ Contributors
- **Deepthi M (PES1UG23AM092)**
- **Samrudhi Rao (PES1UG23AM915)**

