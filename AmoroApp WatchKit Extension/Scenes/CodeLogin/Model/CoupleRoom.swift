//
//  CoupleRoom.swift
//  CloudKitTest
//
//  Created by Vinícius Pinheiro on 06/03/21.
//

import Foundation
import CloudKit

class CoupleRoom {
    var roomNumber: Int
    var isOccupied: Int
    var recordID: CKRecord.ID? = nil
    var creatorUserID: CKRecord.ID? = nil
    var container: CKContainer {
        return CKContainer(identifier: "iCloud.com.viniciuspinheiro.Amoro")
    }
    
    init(roomNumber: Int,isOccupied: Int?, creatorID: CKRecord.ID? = nil, recordID: CKRecord.ID? = nil) {
        self.roomNumber = roomNumber
        self.isOccupied = isOccupied ?? 0
        self.creatorUserID = creatorID
        self.recordID = recordID
    }
    
    func createRecord(completionHandler: @escaping (Error?) -> ()) {
        // dar o tipo primitivo
        let record = CKRecord(recordType: "CoupleRoom")
        
        //transformar os valores recebidos em CKValue
        record.setValue(self.roomNumber, forKey: "roomNumber")
        record.setValue(self.isOccupied, forKey: "isOccupied")

        container.publicCloudDatabase.save(record) {_, error in
            if let error = error {
                completionHandler(error)
            } else {
                completionHandler(nil)
                
            }
        }
    }
    
    
    func readRecords(completionHandler: @escaping ([CoupleRoom]?, Error?)-> ()) {
        // todos os registros que tem no nosso banco de dados
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "CoupleRoom", predicate: predicate)
        
        // executar a consulta
        let operation = CKQueryOperation(query: query)
        
        //criando array de categorias, que vamos mandar para nossa closure
        var coupleRoomRecords : [CoupleRoom] = []
        //ler todos os nossos registros e de um por um vai deixando disponivel, para realizar alguma lógica,
        operation.recordFetchedBlock = {record in
            let rooms = CoupleRoom(roomNumber: record["roomNumber"] as! Int, isOccupied: record["isOccupied"] as? Int, creatorID: record.creatorUserRecordID, recordID: record.recordID)
            // adicionar no nosso array
            coupleRoomRecords.append(rooms)
        }
        // vai ser executado assim que a nossa consulta for realizada, ela também é uma closure
        //o cursor é usado quando a gente tem uma busca mais completa
        operation.queryCompletionBlock = {(cursor, error) in
            // verifica se o erro é nulo a gente pode adicionar os nossos valores da array
            if error == nil {
                completionHandler(coupleRoomRecords, nil)
            } else {
                completionHandler(nil, error)
            }
        }
        // executar, se não der erro
        container.publicCloudDatabase.add(operation)
    }
}
