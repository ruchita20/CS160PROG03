# This imports all the layers for "DeriveWatchNew" into derivewatchnewLayers
PSD = Framer.Importer.load "imported/DeriveWatchNew"

#get all layers 
categories = PSD.Categories
locations = PSD.Locations
contacts = PSD.Contacts
time = PSD.Time
setTheme=PSD.SettingsThemes
homepage = PSD.HomePage
startpage = PSD.Startdrift

# get Categories
categoriesChild= PSD.Categories.subLayers[1].subLayers
topnav= PSD.Startdrift.subLayers[1]

topnav.on Events.Click, ->
	setTheme.placeBefore(startpage)


#get locations
albumChild = PSD.Locations.subLayers[2].subLayers

#checkmark
contactNext = PSD.Contacts.subLayers[0]

#time
timeBack = PSD.Time.subLayers[1].subLayers[1]
timeNext = PSD.Time.subLayers[1].subLayers[0]







#animation
Framer.Defaults.Animation =
  curve: "spring"
  curveOptions:
    tension: 600
    friction: 30
    velocity: 0
    tolerance: 0.01
		

# load each category
for cat in categoriesChild
	cat.animate
		properties:
      opacity: 1
		curve: "spring"

#shadow mouse

bar = categoriesChild[3]
bar.backgroundColor=" rgba(124, 252, 0, 0)"

setTheme.on Events.Click, ->
	startpage.placeBefore(setTheme)
	
	
homepage.on Events.Click, ->
	startpage.placeBefore(homepage)

startpage.on Events.Click, ->
	categories.placeBefore(startpage)
	
categories.on Events.Click, ->
	bar.backgroundColor ="rgba(124, 252, 0, 0)"
	locations.placeBefore(categories)
	#load Locations
	for album in albumChild
		album.opacity=1
		album.states.add 
    	second: {scale:0.95} 
    	third:  {rotation:0.3, scale:0.75}
			album.states.animationOptions = curve: "spring(600,30,0)"
			album.states.next()
	 
	 album1 = albumChild[0]
	 album1.on Events.MouseOver, (event, layer) ->
   		album1.backgroundColor ="rgba(124, 12, 33, 0.5)"
    
	#click on location
	 album1.on Events.Click, (event, layer) ->
	 	contacts.placeBefore(locations)
	 	contactNext.on Events.Click, (event, layer) ->
	 		time.placeBefore(contacts)
	 		timeNext.on Events.Click, (event, layer) ->
	 				startpage.placeBefore(time)
	 		timeBack.on Events.Click, (event, layer) ->
	 			contacts.placeBefore(time)
	 			
	 			
	 			
	 			
	 			
			  
			  
			  

					
			 
			
			


	


	

		












  


	
	


	

	


