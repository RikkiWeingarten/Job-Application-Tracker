import requests

API_URL = 'https://job-salary-data.p.rapidapi.com'
API_KEY = '51cf584dfemsh2c1746d612c97b5p18625cjsna6eee299c59c'

headers = {
    'X-RapidAPI-Host': 'job-salary-data.p.rapidapi.com',
    'X-RapidAPI-Key': API_KEY
}


def get_salary_data(job_title, location):
    url = f'{API_URL}/job-salary'
    params = {
        'job_title': job_title,
        'location': location
    }
    response = requests.get(url, headers=headers, params=params)
    if response.status_code == 200:
        return response.json()
    else:
        print(f'Error: {response.status_code} - {response.text}')
        return None
