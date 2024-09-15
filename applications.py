import os
import sqlite3
import csv

DB_NAME = 'applications.db'


def upload_csv_to_db(db_name='applications.db'):
    # List of CSV files and corresponding table names
    csv_files = {
        'application': 'Application',
        'company': 'Company',
        'interview': 'Interview',
        'position': 'Position'
    }

    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    # Iterate over the CSV files and upload data to the corresponding table
    for file_name, table_name in csv_files.items():
        csv_path = os.path.join(os.getcwd(), f'{file_name}.csv')

        if not os.path.exists(csv_path):
            print(f"Warning: {csv_path} does not exist. Skipping.")
            continue

        with open(csv_path, 'r') as file:
            reader = csv.reader(file)
            columns = next(reader)  # Get column headers

            query = f'INSERT INTO {table_name} ({", ".join(columns)}) VALUES ({
                ", ".join(["?" for _ in columns])})'

            for data in reader:
                cursor.execute(query, data)

        print(f"Data successfully imported to {
              table_name} table from {csv_path}")

    conn.commit()
    conn.close()



def create_job_application(application_job_name, company_name, position_name, category, year_experience, application_date, followup_date, salary, status):
    # Establish database connection
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()

    # Check if the company exists
    cursor.execute(
        "SELECT id FROM company WHERE company_name = ?", (company_name,))
    company_result = cursor.fetchone()

    if company_result:
        company_id = company_result[0]
    else:
        cursor.execute(
            "INSERT INTO company (company_name) VALUES (?)", (company_name,))
        conn.commit()  # Save the new company to get the company_id

        # Retrieve the newly inserted company_id
        company_id = cursor.lastrowid
        print(f"New company '{company_name}' created with ID {company_id}")

    # Get position_id based on the position name
    cursor.execute("SELECT id FROM position WHERE position_name = ?", (position_name,))
    position_result = cursor.fetchone()

    if position_result:
        position_id = position_result[0]
    else:
        cursor.execute(
            "INSERT INTO position (position_name, category, year_experience) VALUES (?, ?, ?)", (position_name, category, year_experience))
        conn.commit()  

        # Retrieve the newly inserted company_id
        position_id = cursor.lastrowid
        print(f"New company '{position_name}' created with ID {position_name}")

    cursor.execute('''
        INSERT INTO Application (application_job_name, company_id, position_id, application_date, followup_date, salary, status)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', (application_job_name, company_id, position_id, application_date, followup_date, salary, status))

    conn.commit()
    conn.close()

    print(f"Job application for '{
          application_job_name}' created successfully!")




def create_interview(round, place, type, company_id, app_id):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO Interview (round, place, type, company_id, app_id)
        VALUES (?, ?, ?, ?, ?)
    ''', (round, place, type, company_id, app_id))
    conn.commit()
    conn.close()


def update_application_status(app_id, status):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        UPDATE Application SET status = ? WHERE id = ?
    ''', (status, app_id))
    conn.commit()
    conn.close()


def delete_job_application(app_id):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        DELETE FROM Application WHERE id = ?
    ''', (app_id,))
    conn.commit()
    conn.close()


def get_applications_by_company(company_name):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    query = '''
        SELECT Application.* 
        FROM Application
        JOIN Company ON Application.company_id = Company.id
        WHERE Company.company_name = ?
    '''
    cursor.execute(query, (company_name,))
    rows = cursor.fetchall()
    conn.close()
    return rows


def get_applications_by_position(position_name):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    query = '''
        SELECT Application.*
        FROM Application
        JOIN Position ON Application.position_id = Position.id
        WHERE Position.position_name = ?
    '''
    cursor.execute(query, (position_name,))
    rows = cursor.fetchall()
    conn.close()
    return rows


def get_applications_by_status(status):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    query = '''
        SELECT * FROM Application
        WHERE status = ?
    '''
    cursor.execute(query, (status,))
    rows = cursor.fetchall()
    conn.close()
    return rows


def track_job_application(company_name, position_name):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    query = '''
        SELECT Application.application_job_name, Application.status, Interview.round, Interview.type
        FROM Application
        JOIN Company ON Application.company_id = Company.id
        JOIN Position ON Application.position_id = Position.id
        JOIN Interview ON Interview.app_id = Application.id
        WHERE Company.company_name = ? AND Position.position_name = ?
    '''
    cursor.execute(query, (company_name, position_name))
    rows = cursor.fetchall()
    conn.close()
    return rows
