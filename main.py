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
            app_id = int(input("Enter application ID: "))
            create_interview(round, place, type, company_id, app_id)

        elif choice == "4":
            app_id = int(input("Enter application ID: "))
            status = input("Enter new status (open/closed): ")
            update_application_status(app_id, status)

        elif choice == "5":
            app_id = int(input("Enter application ID to delete: "))
            delete_job_application(app_id)

        elif choice == "6":
            company_name = input("Enter company name: ")
            applications = get_applications_by_company(company_name)
            print("\n--- Applications for Company:", company_name, "---")
            for app in applications:
                print(f"Application ID: {app[0]}\nJob Name: {app[1]}\nPosition ID: {app[2]}\nCompany ID: {app[3]}"
                      f"\nApplication Date: {app[4]}\nFollow-up Date: {app[5]}\nSalary: {app[6]}\nStatus: {app[7]}\n")

        elif choice == "7":
            position = input("Enter position: ")
            applications = get_applications_by_position(position)
            print(f"\n--- Applications for Position: {position} ---")
            for app in applications:
                print(f"Application ID: {app[0]}\nJob Name: {app[1]}\nCompany ID: {app[2]}\nPosition ID: {app[3]}"
                      f"\nApplication Date: {app[4]}\nFollow-up Date: {app[5]}\nSalary: {app[6]}\nStatus: {app[7]}\n")

        elif choice == "8":
            status = input("Enter application status (open/closed): ")
            applications = get_applications_by_status(status)
            print(f"\n--- Applications with Status: {status} ---")
            for app in applications:
                print(f"Application ID: {app[0]}\nJob Name: {app[1]}\nCompany ID: {app[2]}\nPosition ID: {app[3]}"
                      f"\nApplication Date: {app[4]}\nFollow-up Date: {app[5]}\nSalary: {app[6]}\nStatus: {app[7]}\n")

        elif choice == "9":
            company_name = input("Enter company name: ")
            position_name = input("Enter position name: ")
            results = track_job_application(company_name, position_name)
            print(
                f"\n--- Tracking Job Application for {position_name} at {company_name} ---")
            for result in results:
                print(f"Job Name: {result[0]}\nStatus: {result[1]}\nInterview Round: {
                      result[2]}\nInterview Type: {result[3]}\n")

        elif choice == "0":
            print("Exiting...")
            break

        else:
            print("Invalid choice, try again.")


if __name__ == '__main__':
    main()
