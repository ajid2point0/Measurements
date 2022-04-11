//
//  DoublyLinkedList.swift
//  Measurements
//
//  Created by Abderrahman Ajid on 11/4/2022.
//

import Foundation

class DoublyLinkedList<T: Equatable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    var size: Int = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    // Adding a new item to the end of the linked list.
    func append(_ value: T) {
        let newNode = Node(value: value)
        guard self.head != nil else {
            self.head = newNode
            self.tail = newNode
            self.size += 1
            return
        }
        self.tail?.next = newNode
        newNode.prev = self.tail
        self.tail = newNode
        self.size += 1
    }
    
    // Adding a new item to the beginning of the linked list.
    func prepend(_ value: T) {
        let newNode = Node(value: value)
        guard self.head != nil else {
            self.head = newNode
            self.tail = newNode
            self.size += 1
            return
        }
        self.head?.prev = newNode
        newNode.next = self.head
        self.head = newNode
        self.size += 1
    }
    
    // Returning all items in the linked list as an array of values sorted from the head to tail.
    func items() -> [T] {
        guard self.head != nil else {
            return []
        }
        var allItems = [T]()
        var curr = self.head
        while curr != nil {
            allItems.append(curr!.value)
            curr = curr?.next
        }
        return allItems
    }
    
    //Inserting a node at the given position we would want to insert it at.
    func insertAtIndex(_ value: T, atIndex: Int) {
        guard atIndex >= 0 && atIndex <= self.size else {
            print("Error, index out of bounds")
            return
        }
        if atIndex == 0 {
            self.prepend(value)
        } else if atIndex == self.size {
            self.append(value)
        } else {
            let newNode = Node(value: value)
            var curr = self.head
            for _ in 0..<atIndex {
                curr = curr?.next
            }
            curr?.prev?.next = newNode
            newNode.prev = curr?.prev
            curr?.prev = newNode
            newNode.next = curr
            self.size += 1
        }
    }
    
    // This method returns the value of the node at the given index.
    func getAtIndex(_ index: Int) -> T? {
        guard index >= 0 && index <= self.size else {
            print("Error, index out of bounds")
            return nil
        }
        var curr = self.head
        for _ in 0..<index {
            curr = curr?.next
        }
        return curr?.value
    }
}

extension DoublyLinkedList {
    
    // Adding multiple items to the beginning of the linked list.
    func prepend(contentOf array: [T]) {
        array.forEach {
            self.prepend($0)
        }
    }
    
    // Remove items from the end of the linked list until size equal maxSize.
    func removeAll(until maxSize: Int) {
        guard maxSize > 0, size > maxSize else { return }
        while size > maxSize {
            guard let node = self.tail?.prev else {return}
            node.next = nil
            self.tail = node
            size -= 1
        }
    }
    
}
