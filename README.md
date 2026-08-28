# SQL Server & Word Mail Merge Document Automation

Automates document generation by extracting order data from Microsoft SQL Server (`AdventureWorks2022`) to CSV and binding it to a Microsoft Word Mail Merge template (`.docx`). Presentation formatting (currency and dates) and conditional payment terms are handled entirely inside Word field codes to keep database queries clean.

---

## Workflow Overview

```text
MSSQL Server (AdventureWorks2022)
          │
          ▼ (T-SQL Query Export)
data/mock_adventureworks_orders.csv
          │
          ▼ (Mail Merge Data Source)
templates/Order_Confirmation_Template.docx
          │
          ▼
Finished Customer Receipts & Invoices