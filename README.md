# ETL PROJECT


<<image>>

The goal of this project is to practice the three processes for a data engineer: extract, transform and load the data. For this project, I extracted the data from Dungeons and Dragons (or DnD, a fantasy tabletop role-playing game dated in 1974 but with several updates) to create playable characters extracted from the Lord of the Rings movie.

## Requeriments ✔

♦ Extract data from 3 different sources using 2 different tools.
    
♦ Use functions, list comprehensions, string operations, scrapping...
    
## Sources and tools 🛠
    
For this project, my 3️⃣ sources were:
    
   • Five .csv files from Kaggle about DnD to build the database: classes, races, equipment, monsters and spells. 
    
   • DnD API source to enrich the database.
    
   • Wikipedia, to get the information about the movie character.

The tools that have been employed were:
    
   • 'Get' requesting from the API source.
    
   • Web scrapping with Selenium.
    
    
## Step-by-step process 🏃‍♂️
    

1️⃣ I started cleaning the data from Kaggle: classes.csv, races.csv and equipment.csv. Due to the hard cleaning, I decided to focus on main characteristics and I skipped monsters and spells. I got three new and clean .csv data and a new one from alignment based on the races description.
    
2️⃣ Thanks to the API source, I could work on new data such as stats, subclasses, subraces and languages. These tables are additional information about the character and background when you build the character.
    
3️⃣ I figured out I do not have a straight relationship between some of my data, such as classes, stats or races, when indeed they are. So, I researched to fix it:
    
    • I build some functions to build the stats: a six dice function (as a basic dice rolling), a random stats generator function (based on DnD handbook(*1) where you roll four dices to sum the highest three to stablish a value for your stats) and a stats modifier function (based on DnD handbook(*1) where you have to substract 10 to your stat and to divide it by 2 for getting your modifier). Now I could make any stat I wanted but I could not relationate them with other data, so I had to stablish predefined stats by class, based on the handbook(*2). This way, stats and classes were relationated, but... what about races?
    
    • It was hard to join races and classes because of you can choose any class for any race though some classes are more appropiate for some races. So I search more information on internet and I found a survey(*3) about 100.000 built characters with the frequency of the combination class/race. I worked the table and I wrote the information on a excel doc, transforming the cases to frequencies and classifying them as 'infrequent' (low frequencies), 'recommended' (high frequencies) and neutral for the rest. Assigning the id for races and classes, I built the combo table that I needed.
    
4️⃣ With my 10 DnD tables, I could build the database so I started with the ERD diagram in MySQL to check the relationships and... it worked! 
    
<<image>>
    
5️⃣ I just needed the info about the character to build his character sheet so... time to scrap Wikipedia! I focused on 'The Lord of the Rings: The Fellowship of the Ring' movie and thanks to Selenium scrapping I get two main data: Character name and race. I took three character as example: Frodo Bolson (a Hobbit), Gimli (a Dwarf) and Legolas (an Elf). 

6️⃣ Time to create! I made a new table in MySQL with all the parameters I considered as important ones to the character sheet and the result was...
    
<< image >>
    
    Now you can check all the posibilities you have to build your DnD character based on a LOTR character!

## Useful Resources 💻
    
https://docs.python.org/3.7/howto/functional.html
    
https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions
    
https://docs.python.org/3/tutorial/errors.html
    
https://stackoverflow.com/questions/tagged/string+python
    
Kaggle source: https://www.kaggle.com/datasets/shadowtime2000/dungeons-dragons
    
Api source: https://www.dnd5eapi.co/docs/#get-/api/subraces/-index-
    
(*1) https://media.wizards.com/2016/downloads/DND/SRD-OGL_V5.1.pdf
    
(*2) https://rpgbot.net/dnd5/characters/classes/
    
(*3) https://www.enworld.org/attachments/db-vkqsw4aaajke-jpg.96949/


“You step into the road, and if you don’t keep your feet, there is no knowing where you might be swept off to.” ― J.R.R. Tolkien