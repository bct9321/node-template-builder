s#!/bin/bash

FILL_CONTENTS=false
if [ "$1" == "fill" ]; then
    FILL_CONTENTS=true
fi

create_directory() {
  for dir in "$@"; do
    if [ ! -d "$dir" ]; then
      mkdir -p "$dir"
      echo "create_directory: $dir"
    fi
  done
}

write_to_file() {
  if [ ! -f "$1" ]; then
    echo "$2" > "$1"
    echo "write_to_file: $1"
  fi
}

echo "Structure setup begin!"

# Directories
create_directory public/css public/js public/images public/downloads
create_directory views/partials
create_directory routes
create_directory models
create_directory controllers
create_directory services
create_directory middlewares
create_directory helpers
create_directory config
create_directory tests/unit tests/integration
create_directory migrations
create_directory docs
create_directory src/scss src/js
create_directory dist/css dist/js
create_directory assets
create_directory bin

echo "Finished create_directorys"

if [ "$FILL_CONTENTS" == "true" ]; then
  echo "Filling file contents with samples"
  # Sample content for specific files
  write_to_file public/css/style.css "body { font-family: Arial, sans-serif; }"
  write_to_file public/js/script.js "console.log('Hello, world!');"
  write_to_file views/partials/header.ejs "<header>Welcome to our site!</header>"
  write_to_file views/partials/footer.ejs "<footer>Copyright 2023</footer>"
  write_to_file views/index.ejs "<h1>Home Page</h1>"
  write_to_file views/about.ejs "<h1>About Us</h1>"
  write_to_file routes/index.js "const express = require('express'); const router = express.Router(); router.get('/', (req, res) => res.render('index')); module.exports = router;"
  write_to_file routes/users.js "const express = require('express'); const router = express.Router(); router.get('/profile', (req, res) => res.send('User profile')); module.exports = router;"
  write_to_file models/user.js "class User { constructor(name) { this.name = name; } } module.exports = User;"
  write_to_file controllers/homeController.js "exports.showHomePage = (req, res) => res.render('index');"
  write_to_file controllers/userController.js "exports.showUserProfile = (req, res) => res.send('User profile');"
  write_to_file services/userService.js "const User = require('../models/user'); exports.createUser = (name) => new User(name);"
  write_to_file middlewares/authMiddleware.js "module.exports = (req, res, next) => { if (req.isAuthenticated()) return next(); res.redirect('/login'); }"
  write_to_file middlewares/errorHandlerMiddleware.js "module.exports = (err, req, res, next) => { console.error(err.stack); res.status(500).send('Something broke!'); }"
  write_to_file helpers/dateHelper.js "exports.getCurrentDate = () => new Date().toISOString();"
  write_to_file config/database.js "module.exports = { connectionString: 'mongodb://localhost:27017/mydb' };"
  write_to_file config/environment.js "module.exports = { env: 'development' };"
  write_to_file tests/unit/sample.test.js "const assert = require('assert'); describe('Sample Test', () => { it('should pass', () => { assert(true); }); });"
  write_to_file tests/integration/sample.test.js "const request = require('supertest'); const app = require('../app'); describe('GET /', () => { it('should respond with 200', (done) => { request(app).get('/').expect(200, done); }); });"
  write_to_file migrations/001_initial_setup.js "exports.up = function(next) { /* code to run the migration goes here */ next(); }; exports.down = function(next) { /* code to undo the migration goes here */ next(); };"
  write_to_file docs/api.md "# API Documentation\n\n- GET /home\n- POST /login\n- GET /logout"
  write_to_file bin/www "#!/usr/bin/env node\n\nconst app = require('../app');\nconst PORT = process.env.PORT || 3000;\napp.listen(PORT, () => { console.log('Server is running on port', PORT); });"
  write_to_file src/scss/style.scss "body { background-color: #f5f5f5; }"
  write_to_file src/js/script.js "import module from './module'; console.log(module.sayHello());"
  write_to_file dist/css/style.css "body { background-color: #f5f5f5; }"
  write_to_file dist/js/script.js "console.log('Compiled JavaScript');"
  write_to_file tsconfig.json "{ \"compilerOptions\": { \"target\": \"es6\", \"module\": \"commonjs\" } }"
  write_to_file .dockerignore "node_modules\n.dist"
else
  echo "Files created with only comments. Run: setup.sh fill to get samples. "
  # Blank content for specific files
  write_to_file public/css/style.css "/* Main stylesheet */"
  write_to_file public/js/script.js "/* Main JavaScript file */"
  write_to_file views/partials/header.ejs "<!-- Header content -->"
  write_to_file views/partials/footer.ejs "<!-- Footer content -->"
  write_to_file views/index.ejs "<!-- Main index view -->"
  write_to_file views/about.ejs "<!-- About page view -->"
  write_to_file routes/index.js "/* Main route */"
  write_to_file routes/users.js "/* User-related routes */"
  write_to_file models/user.js "/* User model definition */"
  write_to_file controllers/homeController.js "/* Logic for home page */"
  write_to_file controllers/userController.js "/* Logic for user-related actions */"
  write_to_file services/userService.js "/* Logic for user-related services */"
  write_to_file middlewares/authMiddleware.js "/* Authentication middleware */"
  write_to_file middlewares/errorHandlerMiddleware.js "/* Global error handler middleware */"
  write_to_file helpers/dateHelper.js "/* Helper function example */"
  write_to_file config/database.js "/* Database configuration */"
  write_to_file config/environment.js "/* Environment-specific configuration */"
  write_to_file tests/unit/sample.test.js "/* Example unit test */"
  write_to_file tests/integration/sample.test.js "/* Example integration test */"
  write_to_file migrations/001_initial_setup.js "/* Initial database migration */"
  write_to_file docs/api.md "# API Documentation"
  write_to_file bin/www "/* Binary script to start server */"
  write_to_file src/scss/style.scss "/* Raw SCSS file */"
  write_to_file src/js/script.js "/* Raw ES6+ JS file */"
  write_to_file dist/css/style.css "/* Compiled CSS */"
  write_to_file dist/js/script.js "/* Compiled JS */"
fi




# If you want TypeScript
write_to_file tsconfig.json "{ /* TypeScript config settings */ }"
# sample typeScript
#write_to_file tsconfig.json "{ \"compilerOptions\": { \"target\": \"ES2019\", \"module\": \"commonjs\", \"strict\": true, \"esModuleInterop\": true, \"skipLibCheck\": true, \"forceConsistentCasingInFileNames\": true, \"outDir\": \"./dist\", \"rootDir\": \"./src\", \"resolveJsonModule\": true, \"moduleResolution\": \"node\", \"sourceMap\": true }, \"include\": [ \"src/**/*.ts\" ], \"exclude\": [ \"node_modules\" ] }"

# If you use Docker
# echo "# Docker configuration commands" > Dockerfile
write_to_file .dockerignore "node_modules"

echo "Finished write_to_files"

# Initialize package.json if it doesn't exist
if [ ! -f "package.json" ]; then
  echo "Initialize package.json"
  npm init -y
fi

# Add the setup script to package.json
if ! grep -q "setup" package.json; then
  echo "npm install"
  npm install
  #npm install --save-dev jq

  # echo "Add the setup script to package.json"
  # jq '.scripts.setup = "bash setup.sh"' package.json > tmp.json && mv tmp.json package.json
fi

echo "Writing README.md"

write_to_file README.md "
Project Structure & Setup Guide
===============================

Welcome to our project! This document provides an overview of the project\'s structure and how to set up your development environment.

Project Structure
-----------------

Here\'s an overview of the directory structure:

\`\`\`
.
├── public             # Static assets served directly to the client
│   ├── css            # CSS styles, typically compiled from SCSS
│   ├── js             # JavaScript files, compiled and minified for production
│   ├── images         # Graphical assets like logos, icons, and content images
│   └── downloads      # Files available for users to download (e.g., PDFs, ZIPs)
├── src                # Raw source files before they\'re processed or compiled
│   ├── scss           # SCSS files, a superset of CSS with additional features
│   └── js             # Modern ES6+ JavaScript source files
├── dist               # Processed files ready for deployment
│   ├── css            # CSS output after SCSS compilation
│   └── js             # JavaScript transpiled to be broadly compatible with browsers
├── views              # Server-side templates
│   └── partials       # Smaller, reusable EJS templates (e.g., headers, footers)
├── routes             # Definitions of application endpoints and their behaviors
├── models             # Representations of data structures and database interactions
├── controllers        # Middle layer handling business logic between routes and models
├── services           # Dedicated business logic modules, often abstracting specific tasks
├── middlewares        # Functions to process requests before hitting the main route handlers
├── helpers            # Utility modules for various common tasks across the application
├── config             # Externalized parameters and constants, possibly environment-specific
├── tests
│   ├── unit           # Tests focused on individual functions or classes
│   └── integration    # Tests verifying the integration of multiple units or subsystems
├── migrations         # Scripts detailing changes to the database schema over time
├── docs               # Comprehensive documentation, user guides, API references, etc.
├── assets             # Miscellaneous resources not served directly to users
├── bin                # Scripts and utilities for project bootstrapping and management
└── package.json       # Metadata about the project, its dependencies, and scripts
\`\`\`

Setup
-----

### Prerequisites

-   Node.js
-   npm (comes bundled with Node.js)
-   Bash (or an equivalent shell)

### Steps to Set Up

1.  Clone the repository:
    \`\`\`
    git clone <repository-url> project-name
    cd project-name
    \`\`\`

2.  Run the setup script:
    \`\`\`
    bash setup.sh
    \`\`\`

    This script performs the following tasks:
    -   Creates necessary directories
    -   Writes initial content to key files
    -   Initializes a \`package.json\` if one doesn\'t exist
    -   Installs necessary Node.js packages (optional)

3.  Install Dependencies (if not done by the setup script):
    \`\`\`
    npm install
    \`\`\`

### Development Workflow

After setting up:

1.  Start the development server:
    \`\`\`
    node bin/www
    \`\`\`
    This will start the app, typically on \`http://localhost:3000\`.

2.  Making changes:
    Use the established directory structure to locate and modify files. When adding new functionalities or modules, try to follow the conventions already established in the project.

3.  Testing:
    Run the test suite using:
    \`\`\`
    npm test
    \`\`\`
    (Note: This assumes you have set up a test script in your \`package.json\`)

4.  Documentation:
    Refer to the \`docs/\` directory for detailed documentation, including API details.

# Docker Build and Push Instructions

These instructions will guide you through the process of building a Docker image for your project and pushing it to a container registry.

## Prerequisites

- Docker installed on your local machine
- An account on a container registry (e.g., Docker Hub)

## Steps

1. **Build the Docker Image:**

   Open a terminal and navigate to the root directory of your project.

   \`\`\`bash
   cd /path/to/your/project \`

Replace \`/path/to/your/project\` with the actual path to your project.

1.  Build the Docker Image:
    Run the following command to build the Docker image. Replace \`<image-name>\` with a suitable name for your image and \`<image-tag>\` with a version or tag for the image.
    \`docker build -t <image-name>:<image-tag> .\`
    For example:
    \`docker build -t myapp:latest .\`
2.  Tag the Image:
    If you plan to push the image to a container registry, you should tag it with the registry\'s address. Replace \`<registry-address>\` with the appropriate registry address, e.g., \`docker.io\` for Docker Hub.
    \`docker tag <image-name>:<image-tag> <registry-address>/<image-name>:<image-tag>\`
    For example:
    \`docker tag myapp:latest docker.io/yourusername/myapp:latest\`
3.  Log In to the Registry:
    Run the following command to log in to your container registry. Replace \`<registry-address>\`, \`<username>\`, and \`<password>\` with your registry\'s address, your registry username, and your registry password.
    \`docker login <registry-address> -u <username> -p <password>\`
4.  Push the Image:
    Push the tagged image to the container registry using the following command:
    \`docker push <registry-address>/<image-name>:<image-tag>\`
    For example:
    \`docker push docker.io/yourusername/myapp:latest\`
5.  Confirm Push:
    After pushing the image, you can confirm its availability on the registry\'s website or through its API.

Conclusion
----------

By following these steps, you can build a Docker image of your project and push it to a container registry for distribution. If you encounter any issues or have questions, feel free to reach out for assistance.
Remember to replace placeholders like \`<image-name>\`, \`<image-tag>\`, \`<registry-address>\`, \`<username>\`, and \`<password>\` with your actual values. Additionally, adapt the instructions to match the specifics of the container registry you\'re using.


### Project Growth

As the project evolves:

1.  Adding Dependencies:
    Add new dependencies using \`npm install <package-name>\`.

2.  Scaling:
    When the project grows, consider modularizing your routes, controllers, and other parts of your codebase. Keep database queries within models and use services for business logic to maintain a clean MVC structure.

3.  Migrations:
    If using a database, manage schema changes using migrations in the \`migrations/\` directory. This ensures that database changes are version-controlled and can be applied across different environments.

Maintaining Code Quality:
As more developers join and the codebase expands, it\'s crucial to maintain code quality. Consider integrating linters, code formatters like Prettier, and static analysis tools. Regularly review and refactor the code.
"


echo "Structure setup complete!"
read -r -p "Press enter to continue"
