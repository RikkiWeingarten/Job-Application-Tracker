from applications import (
    upload_csv_to_db, create_job_application, create_interview, update_application_status, delete_job_application,
    get_applications_by_company, get_applications_by_position, get_applications_by_status, track_job_application
)

from salaries_api import (
    get_salary_data
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
        print("10. Get salary data")
        print("0. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            upload_csv_to_db()

        elif choice == "2":
            application_job_name = input("Enter job application name: ")
            company_name = input("Enter company Name: ")
            position = input("Enter position: ")
            application_date = input("Enter application date (YYYY-MM-DD): ")
            followup_date = input("Enter follow-up date (YYYY-MM-DD): ")
            salary = float(input("Enter salary: "))
            status = input("Enter status (open/closed): ")
            category =  input("Enter Category: ")
            year_experience = input("Enter Years of Experience: ")
            create_job_application(application_job_name, company_name,
                                   position, category, year_experience, application_date, followup_date, salary, status)

        elif choice == "3":
            round = int(input("Enter interview round: "))
            place = input("Enter interview place: ")
            type = input("Enter interview type (technical/hr/manager): ")
            date = input("Enter the date (YYYY-MM-DD): ")
            app_id = int(input("Enter application ID: "))
            create_interview(round, place, type, date, app_id)

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
            print(applications)
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

        elif choice == "10":
            job_title = input("Enter job title: ")
            location = input("Enter location: ")
            salary_data = get_salary_data(job_title, location)

            if salary_data and salary_data.get('status') == 'OK':
                print("\n--- Salary Data ---")
                results = salary_data.get('data', [])
                if results:
                    for result in results:
                        print(f"Job Title: {result.get('job_title', 'N/A')}")
                        print(f"Location: {result.get('location', 'N/A')}")
                        print(f"Publisher: {result.get(
                            'publisher_name', 'N/A')}")
                        print(f"Link: {result.get('publisher_link', 'N/A')}")
                        print(f"Salary Range: {result.get('min_salary', 'N/A')} - {
                              result.get('max_salary', 'N/A')} {result.get('salary_currency', 'N/A')}")
                        print(f"Median Salary: {result.get(
                            'median_salary', 'N/A')} {result.get('salary_currency', 'N/A')}")
                        print(f"Salary Period: {
                              result.get('salary_period', 'N/A')}")
                        print("-" * 50)  # separator for readability
                else:
                    print("No salary data found for this job title and location.")
            else:
                print("Failed to retrieve salary data. Please try again.")

                
        elif choice == "0":
            print("Exiting...")
            break

        else:
            print("Invalid choice, try again.")


if __name__ == '__main__':
    main()
