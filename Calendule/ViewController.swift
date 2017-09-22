//
//  ViewController.swift
//  Calendule
//
//  Created by Ivan on 1/9/17.
//  Copyright © 2017 Talentum. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CustomCellCalendar: UITableViewCell {
    
    @IBOutlet weak var horaCalendar: UILabel!
    @IBOutlet weak var contenidoCalendar: UILabel!
    
}

class ViewController: UIViewController {

    let formatter = DateFormatter()
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    
    @IBOutlet weak var tableViewCalendar: UITableView!
    
    let outsideMonthColor = UIColor(colorWithHexValue: 0x584a66)
    let monthColor = UIColor.white
    let selectedMonthColor = UIColor(colorWithHexValue: 0x3a294b)
    let currentDateSelectedViewColor = UIColor(colorWithHexValue: 0x4e3f5d)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendarView()
        
        calendarView.visibleDates {
            (visibleDates) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
        
        self.tableViewCalendar.dataSource = self
        self.tableViewCalendar.delegate = self
    }
    
    func setupCalendarView() {
        calendarView.minimumInteritemSpacing = 0
        calendarView.minimumLineSpacing = 0
    }
    
    //Indica si la celda ha sido seleccionada
    func handleCellSelected (view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        
        if cellState.isSelected {
            validCell.selectedView.isHidden = false
            
        } else {
            validCell.selectedView.isHidden = true
            
        }
    }

    //Cambia el color del texto de la celda
    func handleCellTextColor (view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CustomCell else { return }
        
        if cellState.isSelected {
            validCell.dateLabel.textColor = selectedMonthColor
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = monthColor
            } else {
                validCell.dateLabel.textColor = outsideMonthColor
            }
        }
    }
    
    //Muestra el mes y el año en el que se encuentra el usuario
    func setupViewsOfCalendar (from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        
        self.formatter.dateFormat = "yyyy"
        self.year.text = self.formatter.string(from: date)
        
        self.formatter.dateFormat = "MMMM"
        self.month.text = self.formatter.string(from: date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Cierra el horario y vuelve al menú principal
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Aqui se contarian el numero de actividades de un dia y se mostrarian solamente esas actividades
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCalendar.dequeueReusableCell(withIdentifier: "CustomCellCalendar", for: indexPath) as! CustomCellCalendar
        
        cell.horaCalendar?.text = "\(indexPath.row):00"
        cell.contenidoCalendar?.text = "Contenido \(indexPath.row)"
        
        return cell
    }
}


extension ViewController: JTAppleCalendarViewDataSource {

    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 09 01")!
        let endDate = formatter.date(from: "2060 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate, numberOfRows: nil, calendar: nil, generateInDates: nil, generateOutDates: nil, firstDayOfWeek: DaysOfWeek.monday, hasStrictBoundaries: nil)
        
        return parameters
    }
}

extension ViewController: JTAppleCalendarViewDelegate {
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)

    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        
        setupViewsOfCalendar(from: visibleDates)
        
    }
}

extension UIColor {
    convenience init (colorWithHexValue value: Int, alpha: CGFloat = 1.0) {
        self.init (
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
