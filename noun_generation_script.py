import requests
from pathlib import Path
import time

# Create the "nouns" folder if it doesn't exist
nouns_folder = Path("nouns")
nouns_folder.mkdir(exist_ok=True)

# Number of nouns to retrieve
num_nouns = 100

for i in range(num_nouns):
    # Generate a random noun ID
    # noun_id = str(random.randint(1, 1000))

    # Construct the URL for the noun SVG
    url = f"https://noun.pics/{i}.svg"

    try:
        # Send a GET request to the URL
        response = requests.get(url)

        # Check if the request was successful
        if response.status_code == 200:
            # Construct the file path for saving the SVG
            file_path = nouns_folder / f"noun_{i}.svg"

            # Save the SVG to the file
            with open(file_path, "wb") as file:
                file.write(response.content)

            print(f"Saved noun SVG: {file_path}")
        else:
            print(f"Failed to retrieve noun SVG: {url}")

    except requests.exceptions.RequestException as e:
        print(f"Error occurred while retrieving noun SVG: {url}")
        print(f"Error message: {str(e)}")

    # Add a small delay between requests to avoid overwhelming the server
    time.sleep(0.5)

print("Noun SVG retrieval completed.")
