from applications import (
    create_job_application, create_interview, update_application_status, delete_job_application,
    get_applications_by_company, get_applications_by_position, get_applications_by_status, track_job_application
)


def main():
    while True:
        print("\n--- Job Application System ---")
        print("1. Upload CSV data")
        print("2. Create job application")
        print("3. Create interview")
        print("4. Update job application status")
        print("5. Delete job application")
        print("6. Select job applications by company")
        print("7. Select job applications by position")
        print("8. Select job applications by status")
        print("9. Track job application")
        print("0. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            csv_file = input("Enter CSV file path: ")
            table_name = input("Enter the table name: ")
            upload_csv_to_db(csv_file, table_name)

        elif choice == "2":
            application_job_name = input("Enter job application name: ")
            company_name = input("Enter company Name: ")
            position = input("Enter position: ")
            application_date = input("Enter application date (YYYY-MM-DD): ")
            followup_date = input("Enter follow-up date (YYYY-MM-DD): ")
            salary = float(input("Enter salary: "))
            status = input("Enter status (open/closed): ")
            create_job_application(application_job_name, company_name,
                                   position, application_date, followup_date, salary, status)

        elif choice == "3":
            round = int(input("Enter interview round: "))
            place = input("Enter interview place: ")
            type = input("Enter interview type (technical/hr/manager): ")
            company_id = int(input("Enter company ID: "))
            create_interview(round, place, type, company_id)

        elif choice == "4":
            app_id = int(input("Enter application ID: "))
            status = input("Enter new status (open/closed): ")
            update_application_status(app_id, status)

        elif choice == "5":
            app_id = int(input("Enter application ID to delete: "))
            delete_job_application(app_id)

        elif choice == "6":
            company_name = int(input("Enter company name: "))
            applications = get_applications_by_company(company_name)
            for app in applications:
                print(app)

        elif choice == "7":
            position = int(input("Enter position: "))
            applications = get_applications_by_position(position)
            for app in applications:
                print(app)

        elif choice == "8":
            status = input("Enter application status (open/closed): ")
            applications = get_applications_by_status(status)
            for app in applications:
                print(app)

        elif choice == "9":
            company_name = input("Enter company name: ")
            position_name = input("Enter position name: ")
            results = track_job_application(company_name, position_name)
            for result in results:
                print(result)

        elif choice == "0":
            print("Exiting...")
            break

        else:
            print("Invalid choice, try again.")


if __name__ == '__main__':
    main()
