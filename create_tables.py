import sqlite3

# Connect to the database
conn = sqlite3.connect('applications.db')
cursor = conn.cursor()

# Example: Select all applications with their company and position
query = """
SELECT Application.application_job_name, Company.company_name, Position.position_name, Application.status
FROM Application
JOIN Company ON Application.company_id = Company.id
JOIN Position ON Application.position_id = Position.id;
"""

cursor.execute(query)
rows = cursor.fetchall()

for row in rows:
    print(row)

# Close the connection
conn.close()
