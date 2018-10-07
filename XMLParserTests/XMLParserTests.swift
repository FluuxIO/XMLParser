//
//  XMLParserTests.swift
//  XMLParserTests
//
//  Created by Mickaël Rémond on 07/10/2018.
//  Copyright © 2018 ProcessOne. All rights reserved.
//

import XCTest
@testable import XMLParser

class XMLParserTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDOM() {
        let serverResponseXML = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
            "<Autodiscover xmlns=\"http://schemas.microsoft.com/exchange/autodiscover/responseschema/2006\">" +
            "  <Response>" +
            "    <Error Time=\"14:52:25.4524532\" Id=\"3280124998\">" +
            "      <ErrorCode>600</ErrorCode>" +
            "      <Message>Invalid Request</Message>" +
            "      <DebugData />" +
            "    </Error>" +
            "  </Response>" +
        "</Autodiscover>"
        
        let serverResponseDocument = XDocument(fromSource: serverResponseXML)
        let serverMessage = serverResponseDocument?.documentElement?.getElementsByTagName("Message").first?.nodeValue
        XCTAssertEqual(serverMessage, "Invalid Request")
        //print(serverMessage) // prints Optional("Invalid Request")
    }


}
