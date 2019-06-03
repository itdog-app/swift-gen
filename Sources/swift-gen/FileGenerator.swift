//
//  FileGenerator.swift
//  swift-gen
//
//  Created by Arror on 2019/5/26.
//

import Foundation

public final class FileGenerator {
    
    private let enumGenerator: EnumGenerator
    private let structGenerator: StructGenerator
    private let serviceGenerator: ServiceGenerator
    
    public init(thrift: TThrift) {
        self.enumGenerator = EnumGenerator(enums: thrift.enums.map { $0.value })
        self.structGenerator = StructGenerator(structs: thrift.structs.map { $0.value })
        self.serviceGenerator = ServiceGenerator(services: thrift.services.map { $0.value })
    }
    
    public func generateFile(type: FileType, printer p: inout CodePrinter) throws {
        self.generateFileHeader(printer: &p)
        self.enumGenerator.generateThriftEnums(type: .client, printer: &p)
        try self.structGenerator.generateThriftStructs(type: .client, printer: &p)
        try self.serviceGenerator.generateThriftService(type: .client, printer: &p)
    }
    
    private func generateFileHeader(printer p: inout CodePrinter) {
        p.print("//\n")
        p.print("// Code generated by thrift & swift-gen.\n")
        p.print("// Don't edit manually.\n")
        p.print("//\n")
        p.print("\n")
        p.print("import Foundation\n")
        p.print("import RTSession\n")
        p.print("\n")
    }
}
