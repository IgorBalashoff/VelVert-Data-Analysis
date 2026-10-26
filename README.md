# Vel’Vert — Operational Analysis of an Electric Bike-Sharing Service

## Project overview

Vel’Vert is a training project focused on analysing an electric bike-sharing service. The objective is to help an operations team identify stations that need attention, understand trip patterns, and make data-informed decisions.

The project follows a practical data analyst workflow: querying data in PostgreSQL, analysing results with SQL, building an interactive Power BI dashboard, and communicating operational recommendations.

## Tools and skills

- **PostgreSQL** — querying station and trip data
- **SQL** — filtering, sorting, conditional logic, and data analysis
- **DBeaver** — database exploration and query execution
- **Microsoft Power BI** — dashboard creation and operational reporting
- **Power Query and DAX** — data preparation, measures, and indicators
- **Data analysis and visualisation** — identifying operational priorities

## Dataset

The exercise uses two tables:

- `stations` — station names, available bikes, total capacity, neighbourhood, and installation date
- `trajets` — trip identifiers, departure station, trip duration, and trip date

The training dataset represented in the report contains **12 stations and 40 trips**.

## SQL analysis

The SQL exercises progress from basic queries to operational decision-making:

- Selecting and filtering station data
- Sorting results by capacity, name, and available bikes
- Identifying stations with low bike availability or high occupancy
- Analysing trip durations and dates
- Combining conditions with `AND` and `OR`
- Calculating bike availability rates
- Prioritising stations for replenishment

**SQL source file:** [`requetes_velvert.sql`](./requetes_velvert.sql)

## Power BI dashboard

The report contains four pages:

1. **Overview** — headline indicators and daily trip activity
2. **Stations** — bike availability, fill rates, station categories, and stations under pressure
3. **Trips** — trip-duration indicators and trip activity by day
4. **Operations management** — potentially atypical trips, neighbourhood filtering, and station prioritisation

## Key findings

- 12 stations and 40 trips are represented in the report.
- 5 stations are below the 20% bike-availability threshold.
- The overall availability rate displayed on the Stations page is **41.02%**.
- The average trip duration is approximately **23 minutes**.
- The longest trip shown in the report lasts **66 minutes**.

The SQL exercise and the Power BI report use different thresholds in some trip-duration analyses. These should be interpreted in the context of the specific exercise.

## Operational recommendation

Prioritise stations with less than 20% bike availability, starting with the lowest availability rate. Use the station name, neighbourhood, available-bike count, and total capacity to support operational decisions.

## Deliverables

- [`requetes_velvert.sql`](./requetes_velvert.sql) — commented SQL queries
- [`VelVert_Operational_Analysis_EN.pdf`](./VelVert_Operational_Analysis_EN.pdf) — analytical report
- Four Power BI dashboard screenshots
- This README — project overview and documentation

*Training project — Simplon Data Analyst Programme, 2026.*
