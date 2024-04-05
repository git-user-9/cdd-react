# Step 1: Use an official Node.js runtime as a parent image
FROM node:14

# Step 2: Set the working directory in the container to /app
WORKDIR /app

# Step 3: Clone the repository containing the React app
# Note: The provided URL was not a direct link to a zip file but a GitHub repo. Adjust if you have a direct zip file URL.
RUN git clone https://github.com/mokshit-giddanti/React.git .

# Step 4: Install the dependencies defined in package.json
RUN npm install

# Step 5: Make port 3000 available to the world outside this container
# This assumes that your React app runs on port 3000 (default for create-react-app)
EXPOSE 3000

# Step 6: Define the command to run the app
CMD ["npm", "start"]
