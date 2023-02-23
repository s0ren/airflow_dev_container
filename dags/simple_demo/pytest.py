

## inspired by https://stackoverflow.com/questions/48393065/run-apache-airflow-dag-without-apache-airflow
if __name__ != "__main__":
    from airflow.decorators import dag, task
else:
    mock_decorator = lambda f=None,**d: f if f else lambda x:x
    dag = mock_decorator
    task = mock_decorator
    

# from airflow.decorators import dag, task
import datetime
import psutil

@task()
def extract_some_sys_info():
    """
        Er _ikke_ atomisk, da funtionen (som er en task), returnere resultatet, i sedet for at gemme det
    """
    # print('YeeHah!')

    ## Bare for at aflæse et eller andet, aflæser vi netværket for hvor mange bytes ind og ud, og cpu load
    # Se https://psutil.readthedocs.io/en/latest/index.html?highlight=net%20io#psutil.net_io_counters
    snetio = psutil.net_io_counters()
    res = snetio._asdict()
    ## Se https://psutil.readthedocs.io/en/latest/index.html?highlight=cpu#psutil.cpu_percent
    res['cpu_load_pct'] =  psutil.cpu_percent(interval=1) # blokkerer i 1 sek
    print(res)
    return res

@dag(
    dag_id="_VerySimpleTest",
    start_date=datetime.datetime(2023, 2, 1, 0, 0, 0),
    schedule=datetime.timedelta(minutes=1),
    catchup=False,
    # full_filepath='.',
)
def main():
    return extract_some_sys_info()

main()