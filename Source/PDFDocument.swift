//
//  PDFDocument.swift
//  TPPDF
//
//  Created by Philip Niedertscheider on 12/08/2017.
//
//

public class PDFDocument: TPJSONSerializable {
    
    // MARK: - PUBLIC VARS
    
    /**
     Holds all layout information
     */
    public var layout: PDFLayout
    
    /**
     Holds all document information
     */
    public var info: PDFInfo = PDFInfo()
    
    /**
     Holds all pagination information
     */
    public var pagination = PDFPagination()

    // MARK: - INTERNAL VARS
    
    /**
     All objects inside the document and the container they are located in
     */
    var objects: [(PDFContainer, PDFObject)] = []
    
    // MARK: - PUBLIC INITIALIZERS
    
    /**
     Creates a new document with the given layout
     
     - parameter layout: Layout information for document
     */
    public init(layout: PDFLayout) {
        self.layout = layout
    }
    
    /**
     Creates a new document with a predefined `PDFPageFormat`
     
     - parameter layout: Predefined page formats
     */
    public init(format: PDFPageFormat) {
        self.layout = format.layout
    }
}
