
import Foundation

struct Player {
    let id: Int
    let name: String
    let team: String
    let rating: String
    let sho: String
    let pas: String
    let text: String
    let imageName: String
    let country: String
    let league: LeagueIds
}

struct TopFivePlayers {
    let players: [Player]
    let league: LeagueIds
}

class TopPlayersViewModel {
    
    let playersArray = [
        TopFivePlayers(players: [
            Player(id: 1, name: "Rodri",
                   team: "Manchester City",
                   rating: "91",
                   sho: "77",
                   pas: "82",
                   text: "Rodri is a Spanish professional footballer who plays as a defensive midfielder (CDM) for Manchester City in the English Premier League. Known for his exceptional passing and tactical awareness, he has become a key player for both his club and the Spanish national team.\n\n Rodri's FC 25 rating is 91. He has a total of 2,400 attributes, with the following average ratings:\n\nPace rating: 66\nShooting rating: 77\nPassing rating: 82\nDribbling rating: 82\nDefending rating: 85\nPhysical rating: 86\nGoalkeeper rating: 10\n\nSee below for a detailed list of Rodri's attributes.",
                   imageName: "premier1",
                   country: "Spain",
                   league: .premierLeague),
            Player(id: 2, name: "Erling Haaland",
                   team: "Manchester City",
                   rating: "91",
                   sho: "92",
                   pas: "69",
                   text: "Erling Haaland is a Norwegian professional footballer who plays as a striker (ST) for Manchester City in the English Premier League. Renowned for his incredible speed and goal-scoring ability, he has quickly established himself as one of the top forwards in world football.\n\nErling Haaland's FC 25 rating is 91. He has a total of 2,267 attributes, with the following average ratings:\n\nPace rating: 87\nShooting rating: 92\nPassing rating: 69\nDribbling rating: 82\nDefending rating: 48\nPhysical rating: 87\nGoalkeeper rating: 10\n\nSee below for a detailed list of Erling Haaland's attributes.",
                   imageName: "premier2",
                   country: "Norway",
                   league: .premierLeague),
            Player(id: 3, name: "Kevin De Bruyne",
                   team: "Manchester City",
                   rating: "90",
                   sho: "87",
                   pas: "92",
                   text: "Kevin De Bruyne is a Belgian professional footballer who plays as an attacking midfielder (CAM) for Manchester City in the English Premier League. Known for his vision, passing, and playmaking skills, he is widely regarded as one of the best midfielders in the world.\n\nKevin De Bruyne's FC 25 rating is 90. He has a total of 2,393 attributes, with the following average ratings:\n\nPace rating: 67\nShooting rating: 87\nPassing rating: 92\nDribbling rating: 85\nDefending rating: 62\nPhysical rating: 77\nGoalkeeper rating: 11\n\nSee below for a detailed list of Kevin De Bruyne's attributes.",
                   imageName: "premier3",
                   country: "Belgium",
                   league: .premierLeague),
            Player(id: 4, name: "Martin Ødegaard",
                   team: "Arsenal",
                   rating: "89",
                   sho: "80",
                   pas: "88",
                   text: "Martin Ødegaard is a Norwegian professional footballer who plays as an attacking midfielder (CAM) for Arsenal in the English Premier League. He is recognized for his creativity, dribbling ability, and leadership on the field.\n\nMartin Ødegaard's FC 25 rating is 89. He has a total of 2,330 attributes, with the following average ratings:\n\nPace rating: 70\nShooting rating: 80\nPassing rating: 88\nDribbling rating: 88\nDefending rating: 64\nPhysical rating: 68\nGoalkeeper rating: 12\n\nSee below for a detailed list of Martin Ødegaard's attributes.",
                   imageName: "premier4",
                   country: "Norway",
                   league: .premierLeague),
            Player(id: 5, name: "Alisson",
                   team: "Liverpool",
                   rating: "89",
                   sho: "24",
                   pas: "54",
                   text: "Alisson is a Brazilian professional footballer who plays as a goalkeeper (GK) for Liverpool in the English Premier League. Known for his shot-stopping ability and composure under pressure, he has been instrumental in Liverpool's success in recent years.\n\nAlisson's FC 25 rating is 89. He has a total of 1,537 attributes, with the following average ratings:\n\nPace rating: 54\nShooting rating: 24\nPassing rating: 40\nDribbling rating: 50\nDefending rating: 18\nPhysical rating: 55\nGoalkeeper rating: 87\n\nSee below for a detailed list of Alisson's attributes.",
                   imageName: "premier5",
                   country: "Brazil",
                   league: .premierLeague)
        ], league: .premierLeague),
        
        TopFivePlayers(players: [
            Player(id: 1, name: "Kylian Mbappé",
                   team: "Real Madrid",
                   rating: "91",
                   sho: "88",
                   pas: "97",
                   text: "Kylian Mbappé is a French professional footballer who plays as a forward (ST) for Real Madrid in the Spanish Primera Division. He is known for his exceptional speed, dribbling skills, and goal-scoring ability.\n\nKylian Mbappé's FC 25 rating is 91. He has a total of 2,292 attributes, with the following average ratings:\n\nPace rating: 97\nShooting rating: 88\nPassing rating: 78\nDribbling rating: 90\nDefending rating: 41\nPhysical rating: 79\nGoalkeeper rating: 8\n\nSee below for a detailed list of Kylian Mbappé's attributes",
                   imageName: "laLiga1",
                   country: "France",
                   league: .laLiga),
            Player(id: 2, name: "Jude Bellingham",
                   team: "Real Madrid",
                   rating: "90",
                   sho: "84",
                   pas: "80",
                   text: "Jude Bellingham is an English professional footballer who plays as a midfielder (CM) for Real Madrid in the Spanish Primera Division. Recognized for his technical skills and maturity on the ball, he is regarded as one of the brightest young talents in football.\n\nJude Bellingham's FC 25 rating is 90. He has a total of 2,433 attributes, with the following average ratings:\n\nPace rating: 80\nShooting rating: 84\nPassing rating: 79\nDribbling rating: 86\nDefending rating: 78\nPhysical rating: 85\nGoalkeeper rating: 10\n\nSee below for a detailed list of Jude Bellingham's attributes.",
                   imageName: "laLiga2",
                   country: "England",
                   league: .laLiga),
            Player(id: 3, name: "Vinícius Júnior",
                   team: "Real Madrid",
                   rating: "90",
                   sho: "81",
                   pas: "95",
                   text: "Vinícius Júnior is a Brazilian professional footballer who plays as a winger (LW) for Real Madrid in the Spanish Primera Division. Known for his incredible dribbling and pace, he is a key player for his club.\n\nVinícius Júnior's FC 25 rating is 90. He has a total of 2,139 attributes, with the following average ratings:\n\nPace rating: 95\nShooting rating: 81\nPassing rating: 78\nDribbling rating: 88\nDefending rating: 30\nPhysical rating: 70\nGoalkeeper rating: 7\n\nSee below for a detailed list of Vinícius Júnior's attributes.",
                   imageName: "laLiga3",
                   country: "Brazil",
                   league: .laLiga),
            Player(id: 4, name: "M. ter Stegen",
                   team: "Barcelona",
                   rating: "89",
                   sho: "24",
                   pas: "48",
                   text: "Marc-André ter Stegen is a German professional footballer who plays as a goalkeeper (GK) for FC Barcelona in La Liga. He is known for his reflexes and distribution, making him one of the top goalkeepers in Europe.\n\nMarc-André ter Stegen's FC 25 rating is 89. He has a total of 1,512 attributes, with the following average ratings:\n\nPace rating: 48\nShooting rating: 24\nPassing rating: 40\nDribbling rating: 48\nDefending rating: 16\nPhysical rating: 57\nGoalkeeper rating: 87\n\nSee below for a detailed list of Marc-André ter Stegen's attributes.",
                   imageName: "laLiga4",
                   country: "Germany",
                   league: .laLiga),
            Player(id: 5, name: "T. Courtois",
                   team: "Real Madrid",
                   rating: "89",
                   sho: "23",
                   pas: "47",
                   text: "Thibaut Courtois is a Belgian professional footballer who plays as a goalkeeper (GK) for Real Madrid in the Spanish Primera Division. He is recognized for his height, agility, and shot-stopping abilities.\n\nThibaut Courtois's FC 25 rating is 89. He has a total of 1,406 attributes, with the following average ratings:\n\nPace rating: 47\nShooting rating: 23\nPassing rating: 28\nDribbling rating: 50\nDefending rating: 16\nPhysical rating: 50\nGoalkeeper rating: 86\n\nSee below for a detailed list of Thibaut Courtois's attributes.",
                   imageName: "laLiga5",
                   country: "Belgium",
                   league: .laLiga)
        ], league: .laLiga),
        
        TopFivePlayers(players: [
            Player(id: 1, name: "Harry Kane",
                   team: "Bayern Munich",
                   rating: "90",
                   sho: "92",
                   pas: "65",
                   text: "Harry Kane is an English professional footballer who plays as a striker (ST) for Bayern Munich in the Bundesliga. He is known for his goal-scoring ability, versatility, and strong leadership.\n\nHarry Kane's rating is 90. He has a total of 2,200 attributes, with the following average ratings:\n\nPace rating: 78\nShooting rating: 92\nPassing rating: 65\nDribbling rating: 82\nDefending rating: 54\nPhysical rating: 85\nGoalkeeper rating: 10\n\nSee below for a detailed list of Harry Kane's attributes.",
                   imageName: "bundesliga1",
                   country: "England",
                   league: .bundesliga),
            Player(id: 2, name: "Florian Wirtz",
                   team: "Bayer Leverkusen",
                   rating: "88",
                   sho: "77",
                   pas: "81",
                   text: "Florian Wirtz is a German professional footballer who plays as an attacking midfielder (CAM) for Bayer Leverkusen in the Bundesliga. He is celebrated for his creativity, technical skills, and vision.\n\nFlorian Wirtz's rating is 88. He has a total of 2,150 attributes, with the following average ratings:\n\nPace rating: 82\nShooting rating: 77\nPassing rating: 81\nDribbling rating: 85\nDefending rating: 50\nPhysical rating: 74\nGoalkeeper rating: 10\n\nSee below for a detailed list of Florian Wirtz's attributes.",
                   imageName: "bundesliga2",
                   country: "Germany",
                   league: .bundesliga),
            Player(id: 3, name: "Gregor Kobel",
                   team: "Borussia Dortmund",
                   rating: "88",
                   sho: "18",
                   pas: "45",
                   text: "Gregor Kobel is a Swiss professional footballer who plays as a goalkeeper (GK) for Borussia Dortmund in the Bundesliga. Known for his shot-stopping ability and quick reflexes, he is an essential player for his team.\n\nGregor Kobel's rating is 88. He has a total of 1,600 attributes, with the following average ratings:\n\nPace rating: 50\nShooting rating: 18\nPassing rating: 45\nDribbling rating: 32\nDefending rating: 78\nPhysical rating: 89\nGoalkeeper rating: 94\n\nSee below for a detailed list of Gregor Kobel's attributes.",
                   imageName: "bundesliga3",
                   country: "Switzerland",
                   league: .bundesliga),
            Player(id: 4, name: "Jamal Musiala",
                   team: "Bayern Munich",
                   rating: "87",
                   sho: "77",
                   pas: "84",
                   text: "Jamal Musiala is a German professional footballer who plays as an attacking midfielder (CAM) for Bayern Munich in the Bundesliga. His agility, creativity, and technical prowess make him a standout talent.\n\nJamal Musiala's rating is 87. He has a total of 2,100 attributes, with the following average ratings:\n\nPace rating: 85\nShooting rating: 77\nPassing rating: 84\nDribbling rating: 89\nDefending rating: 44\nPhysical rating: 70\nGoalkeeper rating: 10\n\nSee below for a detailed list of Jamal Musiala's attributes.",
                   imageName: "bundesliga4",
                   country: "Germany",
                   league: .bundesliga),
            Player(id: 5, name: "Granit Xhaka",
                   team: "Bayer Leverkusen",
                   rating: "86",
                   sho: "73",
                   pas: "50",
                   text: "Granit Xhaka is a Swiss professional footballer who plays as a midfielder (CM) for Bayer Leverkusen in the Bundesliga. He is recognized for his passing ability, vision, and leadership qualities.\n\nGranit Xhaka's rating is 86. He has a total of 1,800 attributes, with the following average ratings:\n\nPace rating: 65\nShooting rating: 73\nPassing rating: 50\nDribbling rating: 72\nDefending rating: 82\nPhysical rating: 77\nGoalkeeper rating: 10\n\nSee below for a detailed list of Granit Xhaka's attributes.",
                   imageName: "bundesliga5",
                   country: "Switzerland",
                   league: .bundesliga)
        ], league: .bundesliga),
        
        TopFivePlayers(players: [
            Player(id: 1, name: "Lautaro Martinez",
                   team: "Lombardia",
                   rating: "89",
                   sho: "86",
                   pas: "82",
                   text: "Lautaro Martinez is an Argentine professional footballer who plays as a striker (ST) for Lombardia. Known for his strong finishing and technical skills, he has become a key player for his club and country.\n\nLautaro Martinez's rating is 89. He has a total of 2,200 attributes, with the following average ratings:\n\nPace rating: 83\nShooting rating: 86\nPassing rating: 82\nDribbling rating: 88\nDefending rating: 49\nPhysical rating: 80\nGoalkeeper rating: 10\n\nSee below for a detailed list of Lautaro Martinez's attributes.",
                   imageName: "seriaA1",
                   country: "Argentina",
                   league: .serieA),
            Player(id: 2, name: "Victor Osimhen",
                   team: "Napoli",
                   rating: "88",
                   sho: "90",
                   pas: "70",
                   text: "Victor Osimhen is a Nigerian professional footballer who plays as a striker (ST) for Napoli in Serie A. His speed and goal-scoring ability have made him one of the most sought-after forwards in Europe.\n\nVictor Osimhen's rating is 88. He has a total of 2,100 attributes, with the following average ratings:\n\nPace rating: 92\nShooting rating: 90\nPassing rating: 70\nDribbling rating: 81\nDefending rating: 42\nPhysical rating: 78\nGoalkeeper rating: 10\n\nSee below for a detailed list of Victor Osimhen's attributes.",
                   imageName: "seriaA2",
                   country: "Nigeria",
                   league: .serieA),
            Player(id: 3, name: "Paulo Dybala",
                   team: "AS Roma",
                   rating: "87",
                   sho: "86",
                   pas: "80",
                   text: "Paulo Dybala is an Argentine professional footballer who plays as an attacking midfielder (CAM) for AS Roma in Serie A. Known for his creativity and dribbling, he is a key playmaker for his team.\n\nPaulo Dybala's rating is 87. He has a total of 2,050 attributes, with the following average ratings:\n\nPace rating: 76\nShooting rating: 86\nPassing rating: 80\nDribbling rating: 87\nDefending rating: 38\nPhysical rating: 66\nGoalkeeper rating: 10\n\nSee below for a detailed list of Paulo Dybala's attributes.",
                   imageName: "seriaA3",
                   country: "Argentina",
                   league: .serieA),
            Player(id: 4, name: "Theo Hernández",
                   team: "AC Milan",
                   rating: "87",
                   sho: "78",
                   pas: "95",
                   text: "Theo Hernández is a French professional footballer who plays as a left-back (LB) for AC Milan in Serie A. His pace and attacking abilities make him a dangerous player on the wing.\n\nTheo Hernández's rating is 87. He has a total of 2,000 attributes, with the following average ratings:\n\nPace rating: 90\nShooting rating: 78\nPassing rating: 95\nDribbling rating: 84\nDefending rating: 62\nPhysical rating: 80\nGoalkeeper rating: 10\n\nSee below for a detailed list of Theo Hernández's attributes.",
                   imageName: "seriaA4",
                   country: "France",
                   league: .serieA),
            Player(id: 5, name: "A. Bastoni",
                   team: "Lombardia",
                   rating: "87",
                   sho: "51",
                   pas: "69",
                   text: "Alessandro Bastoni is an Italian professional footballer who plays as a center-back (CB) for Lombardia. Known for his defensive skills and ability to build from the back, he is a crucial player for his team.\n\nA. Bastoni's rating is 87. He has a total of 1,800 attributes, with the following average ratings:\n\nPace rating: 61\nShooting rating: 46\nPassing rating: 75\nDribbling rating: 50\nDefending rating: 83\nPhysical rating: 78\nGoalkeeper rating: 10\n\nSee below for a detailed list of A. Bastoni's attributes.",
                   imageName: "seriaA5",
                   country: "Italy",
                   league: .serieA)
        ], league: .serieA),
        
    ]
    
    public func getCountleagues() -> Int {
        return playersArray.count
    }
    
    public func getPlayerFrom(league: LeagueIds, playerId: Int) -> Player? {
        return playersArray
            .first(where: { $0.league == league })?
            .players.first(where: { $0.id == playerId })
    }

}
