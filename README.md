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
```

## Lessons Learned

* **Keep database queries simple:** Raw dates and unformatted numbers should come straight out of SQL without complex string concatenation.
* **Let Word handle formatting:** Using Word field switches (`\@` for dates, `\#` for currency) keeps presentation formatting where it belongs in the doc template.
* **Use conditional logic in templates:** Using `{ IF }` fields in Word allows a single template to handle different order types (like online vs wholesale) without creating multiple template files.
* **Decouple data from design:** Exporting to a clean CSV creates a simple handoff between the database and the reporting layer.