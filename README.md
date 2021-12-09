![microverse-logo](https://img.shields.io/badge/Microverse-blueviolet)

# The Oracle Blog

The Oracle Blog is a Blog that unites all oracle's wannabe of the world. In our app, they found a warm environment for them to share cheap wisdom, enchanting crowds, and more. Oracle's here are so competent that they can distribute wisdom without being consulted, they can make posts, receive commentaries on those posts, and receive likes. If you want to access your blog you'll need to create an Oracle user, but you shall not fear! We can't tell if you are an Oracle.

## Built With

- Ruby
- Rails
- JavaScript
- HTML/CSS

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Git/GitHub;
- Optional ( IDE installed in your machine ) - recommended IDE: Vscode, Rubymine;
- Ruby Installed in your machine;
- Rails gem installed in your machine;

### Setup

- To clone this repo:
  - Open the Terminal(Mac/Linux) or the Cmd (Windows);
  - Navigate to where you want to paste the Repo folder;
  - Type `git clone https://github.com/nelsinofrancisco/ror_oracle_blog.git`;
  - With you preffered IDE open the folder that you cloned before;
- Configuring DB access:
  - Inside the database.yml file modify the Env variables for getting the username and password to access psql database;
- Creating DB (if needed):
  - Run `rails db:create` to create a empty databse for the project.   
  
### Run Website  

- Run `rails s` for starting the server;
- Access [http://localhost:3000/](http://localhost:3000/) in a browser of your choice.
  
### Run Linters

- Run rubocop locally with: `Rspec .` to run all tests or `Rspec [file]` for testing a specific file;
- Run stylelint locally with : `npx stylelint "**/*.{css,scss}"` or `npx stylelint "**/*.{css,scss}" --fix` for autofixing errors.

### Run Tests

- Run `rails spec`.

## Authors

👨‍💻 **Nelsino**

- GitHub: [@nelsinofrancisco](https://github.com/nelsinofrancisco)
- Twitter: [@nelsino_s](https://twitter.com/nelsino_s)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/nelsinofrancisco/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./MIT.md) licensed.
