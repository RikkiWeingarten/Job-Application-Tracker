import sqlite3
import csv

DB_NAME = 'applications.sql'


def upload_csv_to_db(csv_file, table_name, db_name='applications.db'):
    conn = sqlite3.connect(db_name)
    cursor = conn.cursor()

    with open(csv_file, 'r') as file:
        reader = csv.reader(file)
        columns = next(reader)  # Get column headers
        query = f'INSERT INTO {table_name} ({", ".join(columns)}) VALUES ({
            ", ".join(["?" for _ in columns])})'

        for data in reader:
            cursor.execute(query, data)

    conn.commit()
    conn.close()
    print(f"Data successfully imported to {table_name} table.")


def create_job_application(application_job_name, company_id, position_id, application_date, followup_date, salary, status):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO Application (application_job_name, company_id, position_id, application_date, followup_date, salary, status)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', (application_job_name, company_id, position_id, application_date, followup_date, salary, status))
    conn.commit()
    conn.close()


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


def get_applications_by_company(company_id):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        SELECT * FROM Application WHERE company_id = ?
    ''', (company_id,))
    rows = cursor.fetchall()
    conn.close()
    return rows


def get_applications_by_position(position_id):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        SELECT * FROM Application WHERE position_id = ?
    ''', (position_id,))
    rows = cursor.fetchall()
    conn.close()
    return rows


def get_applications_by_status(status):
    conn = sqlite3.connect(DB_NAME)
    cursor = conn.cursor()
    cursor.execute('''
        SELECT * FROM Application WHERE status = ?
    ''', (status,))
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
