# download differtn kaggledata

import kagglehub
import os
import pandas as pd
import kagglehub
import json as js

def flightdata():

    path = kagglehub.dataset_download("rohitgrewal/airlines-flights-data")

    print("Path to dataset files:", path)

    
def load_kaggle_csv(dataset_id="rohitgrewal/airlines-flights-data", file_index=0):
    """
    Download a Kaggle dataset and load a CSV file into a DataFrame.

    Args:
        dataset_id (str): Kaggle dataset identifier, e.g. "rohitgrewal/airlines-flights-data"
        file_index (int): Which CSV to load if there are multiple (default: 0 = first one)

    Returns:
        df (pd.DataFrame): The loaded DataFrame
        files (list): List of dataset files available
    """
    # Download dataset
    path = kagglehub.dataset_download(dataset_id)
    print(f"Dataset downloaded to: {path}")

    # List files
    files = os.listdir(path)
    print("Files in dataset:", files)

    # Pick a CSV file
    csv_files = [f for f in files if f.lower().endswith(".csv")]
    if not csv_files:
        raise FileNotFoundError("No CSV files found in dataset")

    csv_path = os.path.join(path, csv_files[file_index])
    print(f"Loading CSV file: {csv_path}")

    # Load with pandas
    df = pd.read_csv(csv_path)

    dfjson=df.drop(columns=["index"])
    dfjson=dfjson.to_json(orient="records") 

    with open("flightsdata.json","w") as f:
        js.dump(dfjson,f)
    
    return dfjson,df,files
