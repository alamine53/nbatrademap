# nbatrademap
Animated map of player movement in the NBA

Objective: Build an animated map of NBA players moving from one team to another throughout the summer, 
           and keep a tally on the side for the total amount of PPG moved. 
           
Motivation: Can we get a statistical analysis as to whether 
            this is the off-season with the greatest reallocation of per game production of all time?
            
Plan of attack:

Start with two data points: Kevin Durant and Kyrie Irving

1. Durant moves from GSW to BKN while Kyrie moves from BOS to BKN simultaneously. 
2. Replace data points by players' faces. 

Chapter 1
1. Build USA Map and identify NBA cities by coordinates (done)
2. Animate map:
        a. inital map: Have one dot for one player, e.g. Kevin Durant (with GSW coordinates) and Kyrie Irving (with BOS coordinates)
        b. end map: Have both dots in BKN coordinates 
        c. animate so that both dots appear to moving from point A to point B.
        
3. Replace dots by face of player (kyrie and durant)
4. Replicate for all players

Chapter 2
5. add bar chart to the side, as a tally of total PPG moved per date.
