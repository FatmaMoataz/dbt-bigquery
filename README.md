# dbt Crash Course Project

This project is a dbt learning project built around the Jaffle Shop dataset, transformed in BigQuery and prepared for analytics reporting in Power BI.

## Project overview

The workflow follows a typical medallion-style dbt structure:

- Raw data sources from the source tables
- Staging models for cleaning and renaming columns
- Mart models for business-ready analytics tables
- Power BI visualization built on top of the final marts

## Data model

### Source tables
- customers
- orders
- payments

### Staging models
- stg_customers
- stg_orders
- stg_payments

### Mart models
- dim_customers
- fact_orders

## Project structure

```text
dbt_crash_course/
├── dbt_project.yml
├── README.md
├── analyses/
├── macros/
├── models/
│   ├── mart/
│   │   └── core/
│   │       ├── dim_customers.sql
│   │       ├── fact_orders.sql
│   │       └── schema.yml
│   ├── raw/
│   └── stg/
│       └── jaffle_shop/
│           ├── schema.yml
│           ├── stg_customers.sql
│           ├── stg_orders.sql
│           └── stg_payments.sql
├── seeds/
├── snapshots/
├── tests/
└── target/
```

## Setup

1. Make sure dbt is installed.
2. Configure your BigQuery service account in `~/.dbt/profiles.yml`.
3. Test the connection:

```bash
dbt debug --profiles-dir "$HOME/.dbt"
```

## Common dbt commands

Run the full project:

```bash
dbt run
```

Run only staging models:

```bash
dbt run --select stg
```

Run models and tests together:

```bash
dbt build
```

Full refresh:

```bash
dbt run --full-refresh
```

## Power BI visualization

After the dbt models are built successfully, the data can be connected to Power BI for reporting and dashboard creation.

Typical visualizations include:
- Customer order count by customer
- Average order value
- Order status distribution
- Payment trends over time
- First and recent order dates for each customer

The final data used in Power BI should come from the mart tables such as:
- `dim_customers`
- `fact_orders`

## Notes

This project demonstrates the dbt flow from raw source to clean staging layer and then to business-ready analytics tables. It is a good foundation for learning transformations, testing, and dashboarding.

## Resources

- dbt Documentation: https://docs.getdbt.com/
- BigQuery Adapter Docs: https://docs.getdbt.com/reference/warehouse-setups/bigquery-setup
- Power BI: https://powerbi.microsoft.com/
