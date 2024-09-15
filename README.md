# Job Application Tracker - Python Terminal Project

## Overview

This is a Python terminal project designed to manage job applications for a specific user. It provides a command-line interface for users to interact with job application data, perform CRUD operations, sort through applications etc.

## Features

- Add, update, and delete job applications
- View application details by filter
- Add, update and delete interviews
- Import data from CSV

## Requirements

- Python 3.6 or higher
- `sqlite3` for database management
- requests library for api requests

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/RikkiWeingarten/Job-Application-Tracker.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd /Users/[username]/Documents/Github/Job-Application-Tracker
   ```

3. **Install required dependencies:**

   ```bash
   pip install -r requirements.txt
   ```

## Usage

1. **Run the application:**

   ```bash
   python main.py
   ```

2. **Follow the on-screen prompts to import data from csv,view applications by specific filter, crud application,etc.**

   - **1. Upload CSV data** `upload` data to import into db with csv file based on existing db table
   - **2. Create job application** `create` a new job application based on user input
   - **3. Create interview** `create` a new job interview based on user input
   - **4. Update job application status** `Update` a job application status to be (open/closed) by id
   - **5. Delete job application** `delete` a job application by id
   - **6. Select job applications by company** `view` expected job applications filtered by company name
   - **7. Select job applications by position** `view` expected job applications filtered by poistion
   - **8. Select job applications by status** `view` expected job applications filtered by status
   - **9. Track job application** `find` tracking details of job application (status, interview round, interview type) filtered by company name and postion
   - **10. Get salary data** `view` expected gross salary of position in specific location provided by user input
   - **0. Exit** `exit` quit program


## Contributing

1. **Fork the repository**
2. **Create a new branch:**

   ```bash
   git checkout -b feature/your-feature
   ```

3. **Make your changes and commit them:**

   ```bash
   git commit -m "Add your message here"
   ```

4. **Push to the branch:**

   ```bash
   git push origin feature/your-feature
   ```

5. **Create a pull request**

## Contact

For questions or suggestions, please contact Rikki Wiengarten(mailto:rikkiweingarten@gmail.com) and/or Adina Wolff(mailto:yyamwolff@gmail.com).
