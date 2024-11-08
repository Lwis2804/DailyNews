//
//  NoticiasModelo.swift
//  DailyNews
//
//  Created by LUIS GONZALEZ on 17/10/24.
//

import Foundation

struct NoticiasModelo : Codable {
    var articles : [Noticia]
}

struct Noticia : Codable {
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
}
