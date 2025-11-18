# Hymnum
#### Video Demo:  <https://www.youtube.com/watch?v=xvFZjo5PgG0>
#### Description: 

Hymnum is a prototype of a music repertory manager designed especially for worship ministries in churches. As a christian and member of a local church who serves in the worship team myself, i have long noticed that most Brazillian churches rely on apps to organize their repertories. However, despite being really popular among musicians, these apps are not designed to be used in churches or sight-reading during worship. 

Because of this, we have encountered lots of problems like:
* intrusive ads in worship environment
* desorganized repertories lists
* difficulty categorizing or searching for songs (title, author, tags)
* impossibility of transposing the ciphers offline
* limited synchronization and collaboration between ministry members
* no way to manually edit the lyrics of songs, that vary between congregations

To solve this problems in my local church and, possibly, for other churches as well, i designed the app to be fast, lightweight and focus on the real needs of church musicians:
* repertory collaboration between members of a ministry/church
* offline usage 
* real time offline key transposing
* manual lyrics editing 
* advanced search and song categorizing

For now, however, the app is in its minimal version, but it is structured to grow towards these objectives.

## Features already avalaible:
* offline usage
* manual lyrics editing
* basic funciotionalities related to musics and repertories
* switch to dark/light theme


## Technologies & Architecture:
I decided to use the Flutter framework by Google, as it is the modern standard for mobile development, has easy integration with Google services, seamless native development, and uses Dart, a safe strongly typed language.

To ensure scalability, readability and maintainability, the app is being built using MVVM + pragmatical Clean architecture. 

### MVVM (Model, View, ViewModel) architecture:
The app is divided in the domain layer (Model), and UI (View, ViewModel) layer.
The whole purpose of this architecture is to decople code in single responsability classes.

### Clean Architecture (implementation of Model layer):
There are lots of folders structures in the pure Clean Architecture, but as i am a solo dev, i am using only the most fundamental structure of the architecture: core, data, domain and presentation.  

To maintain the directory organized, the project is feature driven, this means the directory is organized via features, which each have its own Clean structure, data, domain and presentation related to that specific feature.


### Files functionality: 
`main.dart`: instatiate and run the app, and solve dependencies  
`app.dart`: creates the app, define its home page and theme  
`main_page.dart`: defines the navigation to the main app pages

`local_db.dart`: create the database and the SQLite schema of the tables  
`extensions.dart`: extends the functionalities of dart classes  
`validation.dart`: provides helper functions of input validation
`theme_controller.dart`: exposes the current theme and provide a function to change theme 
`settings_page.dart`: defines the settings page view  

`child_sized_modal_bottom_sheet.dart`: defines a reusable bottom sheet type widget  
`discard_changes_alert.dart`: defines a generic alert of unsaved changes  

`music.dart`: defines the structure of the music table and entity  
`imusic_repo.dart`: define functions relationed to the music entity  
`music_repo.dart`: implement the functions defined in `imusic_repo.dart`  
`music_viewmodel.dart`: provides a viewmodel of the music repo for the views  
`musics_page.dart`: defines the musics page view of the musics in a repertory  
`music_item_view.dart`: defines the appearance and behaviour of a single music item in musics page  
`trailing_music_options.dart`: defines the trailing options of a music item  
`music_content_view.dart`: defines the display of the content of music cipher  
`delete_music_alert.dart`: defines a delete music alert  

`repertory.dart`: defines the structure of the repertory table and entity  
`irepertory_repo.dart`: define functions relationed to the repertory entity  
`repertory_repo.dart`: implements the functions defined in `irepertory_repo.dart`  
`repertory_viewmodel.dart`: provides a viewmodel of the repertory repo for the views  
`repertories_page.dart`: defines a view of a list of repertories  
`repertory_list_item.dart`: defines the appearance and behaviour of a single repertory item in repertories page  
`trailing_repertory_options.dart`: defines the traling options of a repertory item  
`delete_repertory_alert.dart`: defines a delete repertory alert  
`empty_list_message.dart`: provides a message when there is no repertories in repertories page  
`rename_repertory_bottom_sheet.dart`: provides a bottom sheet type form for renaming a repertory  

`repertory_music_table.dart`: defines the structure the relational table repertory_music  
`repertory_music_service.dart`: provides a relational service between repertories and musics  






