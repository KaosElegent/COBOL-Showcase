# COBOL Showcase

Hey there! This repo contains the **readcbl** module. The COBOL file showcases my ability to use the language. It is capable of reading fixed-length data files and performing arithmetric operations.

# Table of Contents

- [Why Cobol?](https://github.com/KaosElegent/COBOL-showcase/tree/main#why-cobol)

- [Challanges Faced](https://github.com/KaosElegent/COBOL-showcase/tree/main#challanges-faced)

- [Files](https://github.com/KaosElegent/COBOL-showcase/tree/main#files)


- [Working Demo](https://github.com/KaosElegent/COBOL-showcase/tree/main#working-demo)

- [Notes](https://github.com/KaosElegent/COBOL-showcase/tree/main#notes)


# Why Cobol?

- COBOL can support large volumes of transactional data.

- COBOL is extremely reliable for mission-critical applications, particularly when run on mainframes.
- COBOL is an easy-to-learn language that adapts well to business needs.
- 90% of global financial transactions are processed in COBOL.
- 75% of all daily business transactions are processed in COBOL.
- 70% of all worldwide business data is stored on a Mainframe.
- 70% of mission-critical applications are in COBOL.
- The language supports over 30 billion transactions per day.  
- There are 1.5-2 million developers, globally, working with COBOL code.

# Challanges Faced
I decided to use WSL (Windows Subsystem for Linux) since I'm comfortable with Linux environments, and using a COBOL compiler would be easier due to the readily available/installable packages.

# Files

-  **src/readData.cbl** (Demo file to showcase the **SEQREAD** program)

-  **assets/data** (The fixed-length data file)



# Working Demo

- **The main menu:**

![Main Menu](https://github.com/KaosElegent/COBOL-Showcase/blob/main/assets/images/menu.png?raw=true)

- **Displaying All Records:**

![Display All](https://github.com/KaosElegent/COBOL-Showcase/blob/main/assets/images/displayAll.png?raw=true)

- **Computing the Mean Salary from a City:**

![Mean Salary](https://github.com/KaosElegent/COBOL-Showcase/blob/main/assets/images/validMean.png?raw=true)

- **Invalid City Name:**

![Invalid City Name](https://github.com/KaosElegent/COBOL-Showcase/blob/main/assets/images/invalidMean.png?raw=true)

- **Invalid Menu Option:**

![Invalid City Name](https://github.com/KaosElegent/COBOL-Showcase/blob/main/assets/images/invalidMenu.png?raw=true)

- **Exiting the Program:**

![Invalid City Name](https://github.com/KaosElegent/COBOL-Showcase/blob/main/assets/images/exit.png?raw=true)

# Notes

- It is assumed that a fixed-length datafile with very specific data arrangement will be used.
- Certain bug-fixes and improvements can be made, a couple of which have been added as issues on GitHub.