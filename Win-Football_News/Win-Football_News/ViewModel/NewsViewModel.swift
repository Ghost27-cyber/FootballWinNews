
struct NewsModel {
    let title: String
    let text: String
    let imageName: String
}
import Foundation

class NewsViewModel {
    
    private let newsArray: [NewsModel] = [
        NewsModel(title: "Nicolas Jackson: Man given three-year football banning order for making racist Facebook poste",
                  text: "A man who posted a racist comment about Chelsea striker Nicolas Jackson online has been given a three-year football banning order.\n\nJohn Southwell, 64, posted the offensive comment on Facebook at 12.18pm on December 11, 2023 under a news article about the Chelsea forward.\n'n The article related to a controversial incident the striker had been involved in during Chelsea's 2-0 defeat to Everton the previous day.\n\nAfter being identified, Southwell, who is a Burnley FC supporter, was charged with sending by a public communication network an offensive / indecent / obscene / menacing message / matter.\n\n tSouthwell, of Dale Street, Earby, admitted the offence when he appeared at Blackburn Magistrates Court on Tuesday (October 8, 2024). He was fined £385, ordered to pay £85 prosecution costs and a £138 victim surcharge.\n\nPC Byron Worrall, from Lancashire Police East Division, said: 'This case is unusual in that a football banning order has been issued for an offence committed away from an actual fixture and on social media'.",
                  imageName: "news1"),
        
        NewsModel(title: "Nottingham Forest fined over Stuart Attwell social media comments",
                  text: "Nottingham Forest have been fined £750,000 and warned over their future conduct after posting comments about VAR Stuart Attwell on social media in April.\n\nThe Premier League club had denied that the comments brought the game into disrepute by implying bias and/or questioning the integrity of match officials.\n\nAn independent regulatory commission found the Football Association charge proven, but Forest intend to appeal against the sanction.\n\nForest felt they should have been awarded three penalties during a defeat at Everton last season and after the game, they posted on their official X account:'Three extremely poor decisions - three penalties not given - which we simply cannot accept.'\n\n'We warned the PGMOL that the VAR [Attwell] is a Luton fan before the game but they didn't change him. Our patience has been tested multiple times. NFFC will now consider its options.'",
                  imageName: "news2"),
        
        NewsModel(title: "Peter Cormack: Former Liverpool, Hibernian and Scotland midfielder dies aged 78",
                  text: "Peter Cormack, a Scotland international, won two league titles, the UEFA Cup and FA Cup during a four-year spell at Liverpool between 1972 and 1976, working under manager Bill Shankly\n\nThe Scotland international won two league titles, the UEFA Cup and FA Cup during a four-year spell at Anfield between 1972 and 1976, after being signed by manager Bill Shankly from Nottingham Forest.\n\nCormack was a key figure in the final years of the legendary Liverpool manager, and was a regular under his successor, Bob Paisley, until a knee injury curtailed his career at Anfield.\n\nDeparting with 26 goals in 178 appearances, Cormack signed for Bristol City before returning to Hibernian,the club he began his career with, for a second spell.\n\nCormack went on to manage Partick, Cowdenbeath and Greenock Morton and had a short spell as an international manager for Botswana." ,
                  imageName: "news3"),
        
        NewsModel(title: "Sunderland winger reveals struggles with alcohol addiction",
                  text: "Sunderland's Aaron Connolly has revealed his struggles with alcohol addiction after bursting onto the scene with Brighton as a teenager.\n\n Connolly scored twice in his first Premier League start against Tottenham as a 19-year-old, but subsequently fell into addiction.\n\n'The 24-year-old, signed by Sunderland as a free agent in September after his Hull contract expired, sought help over the summer and has now opened up about his struggles.",
                  imageName: "news4"),
        
        NewsModel(title: "Football Manager 25: Sports Interactive delay video game release until March next year",
                  text: "Sports Interactive has confirmed the latest issue of the popular game Football Manager has been pushed back to March 2025.\n\nThe company had originally targeted a release date in early November but pushed it back to later in the month after citing a 'challenging' development cycle.\n\nAfter making that decision in September, the company released a fresh statement confirming the 'tough decision' to further delay the release date of the game on Thursday.",
                  imageName: "news5"),
        
        NewsModel(title: "Laura Berry named SWPL player of month; Cara Borthwick of Boroughmuir wins SWPL 2 prize",
                  text: "Motherwell's Laura Berry has won the SWPL player of the month award for September, with Boroughmuir's Cara Borthwick claiming the SWPL 2 prize.\n\nThe forward, who started the season at Rangers before returning to the Lanarkshire side on loan, scored eight goals in her four appearances last month.\n\nShe netted four in Motherwell's win against Queen's Park and also scored a last-minute equaliser against Hamilton Accies in the Sky Sports Cup.\n\n17-year-old Cara Borthwick wins the SWPL 2 award for the first time in her career aft\n\nThe side were unbeaten last month and netted 19 goals. They are also the only SWPL 2 side left in the Sky Sports Cup and will face Aberdeen at home in the quarter-final.\n\nThe nominees for the September 2024 SWPL award were Saoirse Noonan (Celtic), Erin Rennie (Spartans), and Katie Wilkinson (Rangers) and for the SWPL 2 award were Erin Halliday (Hamilton Accies) and Eilidh Martin (Kilmarnock).",
                  imageName: "news6"),
        
        NewsModel(title: "Scotland midfielder Kenny McLean 'desperate' to end winless run",
                  text: "Scotland visit Croatia on October 12 before welcoming Portugal to Hampden Park on October 15 in the Nations League; Steve Clarke's side are winless in their last eight competitive fixtures./n/nSteve Clarke's side have won just one of their last 14 matches and are still searching for their first points in their group after losing to Portugal and Poland last month./n/nInjury-hit Scotland will also be without 13 players for the trip to Zagreb, including Aston Villa's John McGinn and Arsenal's Kieran Tierney.\n\nMcLean, who has been capped 42 times for his country, hopes to bring an end to the national team's dreadful run of form on Saturday.",
                  imageName: "news7"),
        
        NewsModel(title: "Bayern Munich 5-2 Arsenal: Pernille Harder scores hat-trick as Gunners capitulate in Champions League",
                  text: "Pernille Harder ended her Champions League goal drought to inspire a 5-2 comeback victory for Bayern Munich over Arsenal.\n\nJonas Eidevall's side arrived in Bavaria off the back of a disappointing goalless draw with Everton in the WSL - but the visitors struck first through Mariona Caldentey (30).\n\nBayern responded before half-time through Glodis Viggosdottir's looping header (43), and the reigning German champions led through Sydney Lohmann's drive 11 minutes after the restart.\n\nKatie McCabe collected her second assist of the night when Laia Codina met her corner (65), but Harder then wrestled control of the contest in devastating fashion.\n\nThe former Chelsea forward, who had failed to score a Champions League goal previously for Bayern across six appearances, headed the hosts back in front from Carolin Simon's corner (73).",
                  imageName: "news8"),
        
        NewsModel(title: "Doak: I didn't expect to be here at 18 but now it feels normal, says Liverpool winger",
                  text: "Ben Doak has learned to deal with life in the spotlight after admitting his Scotland involvement has come earlier than he expected.\n\nThe 18-year-old Liverpool winger - currently on loan at Middlesbrough - made his full international debut against Poland last month after an untimely injury wrecked his dream of going to Euro 2024.\n\nDespite being fast-tracked into the public eye, Doak - who made 10 appearances for the Reds under Jurgen Klopp - insisted he is comfortable with the magnitude of the journey he is on.\n\nDoak's emergence has sparked excitement among Scotland supporters, but he is adamant he does not feel burdened by pressure or expectation because he is doing his best to close out all external noise around his progress.",
                  imageName: "news9"),
        
        NewsModel(title: "Alisson Becker's injury set to rule him out until after November internationals",
                  text: "Alisson to miss crucial run of games in Premier League, Carabao Cup and Champions League for Liverpool after suffering hamstring injury at Crystal Palace on Saturday; watch Liverpool vs Chelsea and Arsenal vs Liverpool live on Sky Sports after October international break\n\nAlisson Becker has sustained a hamstring injury and is not expected to return until after the next international break in November.\n\nThis means Liverpool will be without their No 1 goalkeeper until November.\n\n He is expected to miss matches against Chelsea, Arsenal, Brighton, and Aston Villa in the Premier League, as well as two Champions League fixtures against RB Leipzig and Bayer Leverkusen.\n\nHe was substituted in the second half of Liverpool's 1-0 win over Crystal Palace at Selhurst Park on Saturday. With regular No 2 Kelleher unavailable through illness, 23-year-old Vítezslav Jaros made his Premier League debut, keeping a clean sheet.\n\nKelleher did, however, recover in time to join up with the Republic of Ireland squad for the October international break.",
                  imageName: "news10"),
    ]

    init() {}
    
    public func getCountItems() -> Int {
        return newsArray.count
    }
    
    public func getNews(by id: Int) -> NewsModel? {
        if id >= 0 && id < newsArray.count {
            return newsArray[id]
        }
        
        return nil
    }
}



