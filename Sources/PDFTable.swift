//
//  PDFTable.swift
//  TPPDF
//
//  Created by Philip Niedertscheider on 13/06/2017.
//
//

open class PDFTable {
    
    open var style: PDFTableStyle = PDFTableStyleDefaults.simple
    open var cells: [[PDFTableCell]] = []
    open var widths: [CGFloat] = []
    
    open var padding: Int = 0
    open var margin: Int = 0
    
    open var showHeadersOnEveryPage: Bool = false
    
    public init() {}
    
    public func generateCells(data: [[Any?]], alignments: [[PDFTableCellAlignment]]) throws {
        try PDFTableValidator.validateTableData(data: data, alignments: alignments)
        
        self.cells = []
        
        for (rowIndex, row) in data.enumerated() {
            var contentRow = [PDFTableCell]()
            for (colIndex, col) in row.enumerated() {
                let content = try PDFTableContent(content: col)
                let alignment = alignments[rowIndex][colIndex]
                
                let cell = PDFTableCell(content: content, alignment: alignment)
                contentRow.append(cell)
            }
            self.cells.append(contentRow)
        }
    }
    
    public func setCellStyle(row rowIndex: Int, column columnIndex: Int, style cellStyle: PDFTableCellStyle?) throws {
        if rowIndex < 0 || rowIndex >= cells.count {
            throw PDFError.tableIndexOutOfBounds(index: rowIndex, length: cells.count)
        }
        if columnIndex < 0 || columnIndex >= cells[rowIndex].count {
            throw PDFError.tableIndexOutOfBounds(index: columnIndex, length: cells[rowIndex].count)
        }
        
        let cell = cells[rowIndex][columnIndex]
        cell.style = cellStyle
    }
}
