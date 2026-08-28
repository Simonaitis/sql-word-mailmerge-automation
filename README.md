# Enterprise SQL & Word Mail Merge Document Automation

This repository demonstrates an end-to-end automated document generation workflow. It extracts raw transactional data from Microsoft SQL Server (**AdventureWorks2022**) and populates standardized Microsoft Word customer invoices and order confirmation notices using dynamic field formatting and conditional legal logic.

---

## Architecture & Data Flow

```text
[ MSSQL Server (AdventureWorks2022) ] 
                 │
                 │ (T-SQL Query Export)
                 ▼
     [ mock_adventureworks_orders.csv ]
                 │
                 │ (Mail Merge Binding)
                 ▼
   [ Order_Confirmation_Template.docx ] ────► Finished Output Document