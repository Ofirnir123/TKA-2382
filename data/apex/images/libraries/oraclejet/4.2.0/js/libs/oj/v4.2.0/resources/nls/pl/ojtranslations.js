define({"oj-message":{fatal:"Krytyczny",error:"Błąd",warning:"Ostrzeżenie",info:"Informacja",confirmation:"Potwierdzenie","compact-type-summary":"{0}: {1}"},"oj-converter":{summary:"Wartość nie ma oczekiwanego formatu.",detail:"Proszę podać wartość w oczekiwanym formacie.","plural-separator":", ",hint:{summary:"Przykład: {exampleValue}",detail:'Proszę podać wartość w formacie takim, jaki podano w tym przykładzie: "{exampleValue}"',"detail-plural":'Proszę podać wartość w formacie takim, jaki podano w tych przykładach: "{exampleValue}"'},
optionHint:{detail:'Akceptowaną wartością opcji "{propertyName}" jest "{propertyValueValid}"',"detail-plural":'Akceptowanymi wartościami opcji "{propertyName}" są "{propertyValueValid}"'},optionTypesMismatch:{summary:'Gdy opcja "{propertyName}" jest ustawiona na "{propertyValue}", trzeba podać wartość opcji "{requiredPropertyName}".'},optionTypeInvalid:{summary:'Nie podano wartości oczekiwanego typu dla opcji "{propertyName}".'},optionOutOfRange:{summary:'Wartość {propertyValue} jest spoza zakresu dla opcji "{propertyName}".'},
optionValueInvalid:{summary:'Podano niepoprawną wartość "{propertyValue}" opcji "{propertyName}".'},number:{decimalFormatMismatch:{summary:'Wartość "{value}" nie jest podana w oczekiwanym formacie liczby.'},decimalFormatUnsupportedParse:{summary:'decimalFormat: typy "short" i "long" nie są już obsługiwane przy analizie składniowej konwertera.',detail:"Proszę zmienić składnik na readOnly. Dla pól readOnly nie jest wywoływana funkcja analizy składniowej konwertera."},currencyFormatMismatch:{summary:'Wartość "{value}" nie jest podana w oczekiwanym formacie waluty.'},
percentFormatMismatch:{summary:'Wartość "{value}" nie jest podana w oczekiwanym formacie procentu.'}},datetime:{datetimeOutOfRange:{summary:'Wartość "{value}" jest spoza zakresu dla opcji "{propertyName}".',detail:"Proszę podać wartość z przedziału od {minValue} do {maxValue}.",hour:"godz.",minute:"min",second:"s",millisec:"ms",month:"mies.",day:"dzień",year:"rok","month name":"nazwa miesiąca",weekday:"dzień roboczy"},dateFormatMismatch:{summary:'Wartość "{value}" nie jest podana w oczekiwanym formacie daty.'},
invalidTimeZoneID:{summary:"Podano niepoprawny ID {timeZoneID} strefy czasowej."},nonExistingTime:{summary:"Godzina wejściowa nie istnieje, ponieważ przypada podczas zmiany czasu z zimowego na letni."},missingTimeZoneData:{summary:"Brak danych dotyczących strefy czasowej. Aby je załadować, proszę wywołać: require 'ojs/ojtimezonedata'."},timeFormatMismatch:{summary:'Wartość "{value}" nie jest podana w oczekiwanym formacie godziny.'},datetimeFormatMismatch:{summary:'Wartość "{value}" nie jest podana w oczekiwanym formacie daty i godziny.'},
dateToWeekdayMismatch:{summary:'Dzień "{date}" nie przypada w "{weekday}".',detail:"Proszę podać dzień tygodnia odpowiadający dacie."},invalidISOString:{summary:'Podana wartość napisowa "{isoStr}" nie jest poprawną wartością napisową, zgodną ze standardem ISO 8601.',detail:"Proszę podać poprawną wartością napisową, zgodną ze standardem ISO 8601."}}},"oj-validator":{length:{hint:{min:"Proszę podać {min} lub więcej znaków.",max:"Proszę podać {max} lub mniej znaków",inRange:"Proszę podać {min} lub więcej znaków, maksymalnie {max}.",
exact:"Proszę podać {length} znaki(-ów)."},messageDetail:{tooShort:"Proszę podać {min} lub więcej znaków, nie mniej.",tooLong:"Proszę podać {max} lub mniej znaków, nie więcej."},messageSummary:{tooShort:"Jest za mało znaków.",tooLong:"Jest zbyt wiele znaków."}},range:{number:{hint:{min:"Proszę podać liczbę większą lub równą {min}.",max:"Proszę podać liczbę mniejszą lub równą {max}.",inRange:"Proszę wprowadzić liczbę z przedziału od {min} do {max}.",exact:"Proszę wprowadzić liczbę {num}."},messageDetail:{rangeUnderflow:"Liczba musi być większa lub równa {min}.",
rangeOverflow:"Liczba musi być mniejsza lub równa {max}.",exact:"Liczbą musi być {num}."},messageSummary:{rangeUnderflow:"Liczba jest za mała.",rangeOverflow:"Liczba jest zbyt duża."}},datetime:{hint:{min:"Proszę podać datę i godzinę przypadającą {min} lub później.",max:"Proszę podać datę i godzinę przypadającą {max} lub wcześniej.",inRange:"Proszę podać datę i godzinę przypadającą między {min} a {max}."},messageDetail:{rangeUnderflow:"Data i godzina nie mogą przypadać przed {min}.",rangeOverflow:"Data i godzina nie mogą przypadać po {max}."},
messageSummary:{rangeUnderflow:"Data i godzina przypadają przed datą i godziną minimalną.",rangeOverflow:"Data i godzina przypadają po dacie i godzinie maksymalnej."}},date:{hint:{min:"Proszę podać datę {min} lub późniejszą.",max:"Proszę podać datę {max} lub wcześniejszą.",inRange:"Proszę podać datę między {min} a {max}."},messageDetail:{rangeUnderflow:"Data nie może przypadać przed {min}.",rangeOverflow:"Data nie może przypadać po {max}."},messageSummary:{rangeUnderflow:"Data przypada przed datą minimalną.",
rangeOverflow:"Data przypada do dacie maksymalnej."}},time:{hint:{min:"Proszę podać godzinę {min} lub późniejszą.",max:"Proszę podać godzinę {max} lub wcześniejszą.",inRange:"Proszę podać godzinę między {min} a {max}."},messageDetail:{rangeUnderflow:"Godzina nie może przypadać przed {min}.",rangeOverflow:"Godzina nie może przypadać po {max}."},messageSummary:{rangeUnderflow:"Godzina przypada przed godziną minimalną.",rangeOverflow:"Godzina przypada po godzinie maksymalnej."}}},restriction:{date:{messageSummary:"Data {value} pochodzi z wyłączonego wpisu.",
messageDetail:"Data {value} nie może pochodzić z wyłączonego wpisu."}},regExp:{summary:"Niepoprawny format.",detail:'Wartość "{value}" musi być zgodna z tym wzorcem: "{pattern}"'},required:{summary:"Wartość jest wymagana.",detail:"Trzeba podać wartość."}},"oj-ojInputDate":{done:"Gotowe",cancel:"Anuluj",prevText:"Poprz.",nextText:"Nast.",currentText:"Dzisiaj",weekHeader:"Tydz.",tooltipCalendar:"Wybór daty",tooltipCalendarTime:"Wybór daty i godziny",tooltipCalendarDisabled:"Wybór daty wyłączony",tooltipCalendarTimeDisabled:"Wybór daty i godziny wyłączony",
picker:"Selektor",weekText:"Tydzień",datePicker:"Selektor daty",inputHelp:"Aby uzyskać dostęp do kalendarza, proszę nacisnąć klawisz ze strzałką w dół lub w górę",inputHelpBoth:"Aby uzyskać dostęp do kalendarza, proszę nacisnąć klawisz ze strzałką w dół lub w górę; aby uzyskać dostęp do rozwijanej listy godzin -  klawisz Shift + klawisz ze strzałką w dół lub w górę",dateTimeRange:{hint:{min:"",max:"",inRange:""},messageDetail:{rangeUnderflow:"",rangeOverflow:""},messageSummary:{rangeUnderflow:"",
rangeOverflow:""}},dateRestriction:{hint:"",messageSummary:"",messageDetail:""}},"oj-ojInputTime":{cancelText:"Anuluj",okText:"OK",currentTimeText:"Teraz",hourWheelLabel:"Godzina",minuteWheelLabel:"Minuta",ampmWheelLabel:"AMPM",tooltipTime:"Wybór godziny",tooltipTimeDisabled:"Wybór godziny wyłączony",inputHelp:"Aby uzyskać dostęp do rozwijanej listy godzin, proszę nacisnąć klawisz ze strzałką w dół lub w górę",dateTimeRange:{hint:{min:"",max:"",inRange:""},messageDetail:{rangeUnderflow:"",rangeOverflow:""},
messageSummary:{rangeUnderflow:"",rangeOverflow:""}}},"oj-inputBase":{required:{hint:"",messageSummary:"",messageDetail:""},regexp:{messageSummary:"",messageDetail:""}},"oj-ojInputPassword":{regexp:{messageDetail:'Wartość musi być zgodna z tym wzorcem: "{pattern}"'}},"oj-ojFilmStrip":{labelAccArrowNextPage:"Następna strona",labelAccArrowPreviousPage:"Poprzednia strona",tipArrowNextPage:"Następna",tipArrowPreviousPage:"Poprzednia"},"oj-ojDataGrid":{accessibleSortAscending:"{id} posortowano w porządku rosnącym",
accessibleSortDescending:"{id} posortowano w porządku malejącym",accessibleActionableMode:"Wejście do trybu z wykonywaniem czynności",accessibleNavigationMode:"Proszę wejść do trybu nawigacji, po czym - aby przejść do trybu edycji lub wykonywania czynności - nacisnąć klawisz F2",accessibleEditableMode:"Proszę wejść do trybu edycji, po czym - aby przejść poza tabelę danych - nacisnąć klawisz Escape",accessibleSummaryExact:"To jest tabela danych z {rownum} wierszami i {colnum} kolumnami",accessibleSummaryEstimate:"To jest tabela danych z nieznaną liczbą wierszy i {colnum} kolumn",
accessibleSummaryExpanded:"Liczba obecnie rozwiniętych wierszy wynosi {num}",accessibleRowExpanded:"Wiersz rozwinięty",accessibleRowCollapsed:"Wiersz zwinięty",accessibleRowSelected:"Wybrany wiersz {row}",accessibleColumnSelected:"Wybrana kolumna {column}",accessibleStateSelected:"wybrane",accessibleMultiCellSelected:"Liczba wybranych kolumn wynosi {num}",accessibleColumnSpanContext:"Szerokość {extent}",accessibleRowSpanContext:"Wysokość {extent}",accessibleRowContext:"Wiersz {index}",accessibleColumnContext:"Kolumna {index}",
accessibleRowHeaderContext:"Nagłówek {index} wiersza",accessibleColumnHeaderContext:"Nagłówek {index} kolumny",accessibleRowEndHeaderContext:"Końcowy nagłówek {index} wiersza",accessibleColumnEndHeaderContext:"Końcowy nagłówek {index} kolumny",accessibleLevelContext:"Poziom {level}",accessibleRangeSelectModeOn:"Tryb dodawania wybranego zakresu komórek włączony",accessibleRangeSelectModeOff:"Tryb dodawania wybranego zakresu komórek wyłączony",accessibleFirstRow:"Osiągnięto pierwszy wiersz",accessibleLastRow:"Osiągnięto ostatni wiersz",
accessibleFirstColumn:"Osiągnięto pierwszą kolumnę",accessibleLastColumn:"Osiągnięto ostatnią kolumnę",accessibleSelectionAffordanceTop:"Górny uchwyt wyboru",accessibleSelectionAffordanceBottom:"Dolny uchwyt wyboru",msgFetchingData:"Pobieranie danych...",msgNoData:"Nie ma żadnych elementów do wyświetlenia.",labelResize:"Zmień rozmiar",labelResizeWidth:"Zmień rozmiar: szerokość",labelResizeHeight:"Zmień rozmiar: wysokość",labelSortRow:"Sortuj wiersz",labelSortRowAsc:"Sortuj wiersz rosnąco",labelSortRowDsc:"Sortuj wiersz malejąco",
labelSortCol:"Sortuj kolumnę",labelSortColAsc:"Sortuj kolumnę rosnąco",labelSortColDsc:"Sortuj kolumnę malejąco",labelCut:"Wytnij",labelPaste:"Wklej",labelEnableNonContiguous:"Włącz wybór nieciągły",labelDisableNonContiguous:"Wyłącz wybór nieciągły",labelResizeDialogSubmit:"OK"},"oj-ojRowExpander":{accessibleLevelDescription:"Poziom {level}",accessibleRowDescription:"Poziom {level}, wiersz {num} z {total}",accessibleRowExpanded:"Wiersz rozwinięty",accessibleRowCollapsed:"Wiersz zwinięty",accessibleStateExpanded:"rozwinięte",
accessibleStateCollapsed:"zwinięte"},"oj-ojListView":{msgFetchingData:"Pobieranie danych...",msgNoData:"Nie ma żadnych elementów do wyświetlenia.",indexerCharacters:"A|Ą|B|C|Ć|D|E|Ę|F|G|H|I|J|K|L|Ł|M|N|Ń|O|Ó|P|Q|R|S|Ś|T|U|V|W|X|Y|Z|Ż|Ź",accessibleReorderTouchInstructionText:"Proszę dwukrotnie stuknąć i przytrzymać. Następnie proszę poczekać na dźwięk, po czym przeciągnąć w celu zmiany uporządkowania.",accessibleReorderBeforeItem:"Przed {item}",accessibleReorderAfterItem:"Po {item}",accessibleReorderInsideItem:"Do {item}",
accessibleNavigateSkipItems:"Pomijanie {numSkip} elementów",labelCut:"Wytnij",labelCopy:"Kopiuj",labelPaste:"Wklej",labelPasteBefore:"Wklej przed",labelPasteAfter:"Wklej po"},"oj-_ojLabel":{tooltipHelp:"Pomoc",tooltipRequired:"Wymagane"},"oj-ojLabel":{tooltipHelp:"Pomoc",tooltipRequired:"Wymagane"},"oj-ojInputNumber":{required:{hint:"",messageSummary:"",messageDetail:""},numberRange:{hint:{min:"",max:"",inRange:"",exact:""},messageDetail:{rangeUnderflow:"",rangeOverflow:"",exact:""},messageSummary:{rangeUnderflow:"",
rangeOverflow:""}},tooltipDecrement:"Zmniejszenie",tooltipIncrement:"Przyrost"},"oj-ojTable":{labelAccSelectionAffordanceTop:"Górny uchwyt wyboru",labelAccSelectionAffordanceBottom:"Dolny uchwyt wyboru",labelEnableNonContiguousSelection:"Włącz wybór nieciągły",labelDisableNonContiguousSelection:"Wyłącz wybór nieciągły",labelResize:"Zmień rozmiar",labelResizePopupSubmit:"OK",labelResizePopupSpinner:"Zmień rozmiar kolumny",labelSelectRow:"Wybór wiersza",labelEditRow:"Edycja wiersza",labelSelectAndEditRow:"Wybór i edycja wiersza",
labelSelectColumn:"Wybór kolumny",labelSort:"Sortuj",labelSortAsc:"Sortuj rosnąco",labelSortDsc:"Sortuj malejąco",msgFetchingData:"Pobieranie danych...",msgNoData:"Nie ma żadnych danych do wyświetlenia.",msgInitializing:"Inicjalizowanie...",msgColumnResizeWidthValidation:"Wartość określająca szerokość musi być liczbą całkowitą.",msgScrollPolicyMaxCountSummary:"Przekroczono maksymalną liczbę wierszy dla przewijania tabeli.",msgScrollPolicyMaxCountDetail:"Proszę ponownie załadować z mniejszym zbiorem danych.",
msgStatusSortAscending:"{0} posortowano w porządku rosnącym.",msgStatusSortDescending:"{0} posortowano w porządku malejącym."},"oj-ojTabs":{labelCut:"Wytnij",labelPasteBefore:"Wklej przed",labelPasteAfter:"Wklej po",labelRemove:"Usuń",labelReorder:"Zmień kolejność",removeCueText:"Możliwe do usunięcia"},"oj-ojCheckboxset":{required:{hint:"",messageSummary:"",messageDetail:""}},"oj-ojRadioset":{required:{hint:"",messageSummary:"",messageDetail:""}},"oj-ojSelect":{required:{hint:"",messageSummary:"",
messageDetail:""},searchField:"Pole wyszukiwania",noMatchesFound:"Nie znaleziono zgodnych",oneMatchesFound:"Znaleziono zgodnych: 1",moreMatchesFound:"Znaleziono zgodnych: {num}",filterFurther:"Dostępnych jest więcej wyników; proszę dalej filtrować."},"oj-ojSwitch":{SwitchON:"Wł.",SwitchOFF:"Wył."},"oj-ojCombobox":{required:{hint:"",messageSummary:"",messageDetail:""},noMatchesFound:"Nie znaleziono zgodnych",filterFurther:"Dostępnych jest więcej wyników; proszę dalej filtrować."},"oj-ojInputSearch":{required:{hint:"",
messageSummary:"",messageDetail:""},noMatchesFound:"Nie znaleziono zgodnych",oneMatchesFound:"Znaleziono zgodnych: 1",moreMatchesFound:"Znaleziono zgodnych: {num}"},"oj-ojTree":{stateLoading:"Ładowanie...",labelNewNode:"Nowy węzeł",labelMultiSelection:"Wybór wielokrotny",labelEdit:"Edytuj",labelCreate:"Utwórz",labelCut:"Wytnij",labelCopy:"Kopiuj",labelPaste:"Wklej",labelPasteAfter:"Wklej po",labelPasteBefore:"Wklej przed",labelRemove:"Usuń",labelRename:"Zmień nazwę",labelNoData:"Brak danych"},"oj-ojPagingControl":{labelAccPaging:"Paginacja",
labelAccNavFirstPage:"Pierwsza strona",labelAccNavLastPage:"Ostatnia strona",labelAccNavNextPage:"Następna strona",labelAccNavPreviousPage:"Poprzednia strona",labelAccNavPage:"Strona",labelLoadMore:"Pokaż więcej...",labelLoadMoreMaxRows:"Osiągnięto maksymalny limit {maxRows} wierszy.",labelNavInputPage:"Strona",labelNavInputPageMax:"z {pageMax}",msgItemRangeCurrent:"{pageFrom}-{pageTo}",msgItemRangeCurrentSingle:"{pageFrom}",msgItemRangeOf:"z",msgItemRangeOfAtLeast:"z co najmniej",msgItemRangeOfApprox:"z około",
msgItemRangeItems:"elementy(-ów)",tipNavInputPage:"Idź do strony",tipNavPageLink:"Idź do strony {pageNum}",tipNavNextPage:"Następna",tipNavPreviousPage:"Poprzednia",tipNavFirstPage:"Pierwsza",tipNavLastPage:"Ostatnia",pageInvalid:{summary:"Podana wartość strony jest niepoprawna.",detail:"Proszę podać wartość większą niż 0."},maxPageLinksInvalid:{summary:"Wartość maxPageLinks jest niepoprawna.",detail:"Proszę podać wartość większą niż 4."}},"oj-ojMasonryLayout":{labelCut:"Wytnij",labelPasteBefore:"Wklej przed",
labelPasteAfter:"Wklej po"},"oj-panel":{labelAccButtonExpand:"Rozwiń",labelAccButtonCollapse:"Zwiń",labelAccButtonRemove:"Usuń"},"oj-ojChart":{labelDefaultGroupName:"Grupa {0}",labelSeries:"Seria",labelGroup:"Grupa",labelDate:"Data",labelValue:"Wartość",labelTargetValue:"Cel",labelX:"X",labelY:"Y",labelZ:"Z",labelPercentage:"Procent",labelLow:"Minimum",labelHigh:"Maksimum",labelOpen:"Otwarcie",labelClose:"Zamknięcie",labelVolume:"Wolumen",labelQ1:"Q1",labelQ2:"Q2",labelQ3:"Q3",labelMin:"Min.",labelMax:"Maks.",
labelOther:"Inne",tooltipPan:"Panoramowanie",tooltipSelect:"Zaznaczanie obszaru",tooltipZoom:"Powiększanie obszaru",componentName:"Wykres"},"oj-dvtBaseGauge":{componentName:"Miernik"},"oj-ojDiagram":{promotedLink:"Łącze: {0}",promotedLinks:"Łącza: {0}",promotedLinkAriaDesc:"Pośrednie",componentName:"Diagram"},"oj-ojGantt":{componentName:"Wykres Gantta",accessibleDurationDays:"{0} dni",accessibleDurationHours:"{0} godz.",accessibleTaskInfo:"Godzina początkowa: {0}, godzina końcowa: {1}, czas trwania: {2}",
accessibleMilestoneInfo:"Czas: {0}",accessibleRowInfo:"Wiersz: {0}",accessiblePredecessorInfo:"Poprzedniki: {0}",accessibleSuccessorInfo:"Następniki: {0}",accessibleDependencyInfo:'Typ zależności "{0}"; łączy "{1}" z "{2}"',startStartDependencyAriaDesc:"początek z początkiem",startFinishDependencyAriaDesc:"początek z końcem",finishStartDependencyAriaDesc:"koniec z początkiem",finishFinishDependencyAriaDesc:"koniec z końcem",tooltipZoomIn:"Powiększ",tooltipZoomOut:"Pomniejsz",labelRow:"Wiersz",labelStart:"Początek",
labelEnd:"Koniec",labelDate:"Data",labelBaselineStart:"Początek planu bazowego",labelBaselineEnd:"Koniec planu bazowego",labelBaselineDate:"Data planu bazowego",labelLabel:"Etykieta",labelProgress:"Postęp"},"oj-ojLegend":{componentName:"Legenda"},"oj-ojNBox":{highlightedCount:"{0}/{1}",labelOther:"Inne",labelGroup:"Grupa",labelSize:"Rozmiar",labelAdditionalData:"Dodatkowe dane",componentName:"Widok N-polowy"},"oj-ojPictoChart":{componentName:"Wykres obrazkowy"},"oj-ojSparkChart":{componentName:"Wykres"},
"oj-ojSunburst":{labelColor:"Kolor",labelSize:"Rozmiar",tooltipExpand:"Rozwiń",tooltipCollapse:"Zwiń",componentName:"Wykres pierścieniowy"},"oj-ojTagCloud":{componentName:"Chmura znaczników"},"oj-ojThematicMap":{componentName:"Mapa tematyczna"},"oj-ojTimeAxis":{componentName:"Oś czasu"},"oj-ojTimeline":{componentName:"Ścieżka czasowa",accessibleItemDesc:"Opis: {0}.",accessibleItemEnd:"Godzina zakończenia: {0}.",accessibleItemStart:"Godzina rozpoczęcia: {0}.",accessibleItemTitle:"Tytuł: {0}.",labelSeries:"Seria",
tooltipZoomIn:"Powiększ",tooltipZoomOut:"Pomniejsz"},"oj-ojTreemap":{labelColor:"Kolor",labelSize:"Rozmiar",tooltipIsolate:"Izoluj",tooltipRestore:"Przywróć",componentName:"Mapa drzewa"},"oj-dvtBaseComponent":{labelScalingSuffixThousand:"tys.",labelScalingSuffixMillion:"mln.",labelScalingSuffixBillion:"mld.",labelScalingSuffixTrillion:"bln.",labelScalingSuffixQuadrillion:"bld.",labelInvalidData:"Niepoprawne dane",labelNoData:"Nie ma żadnych danych do wyświetlenia",labelClearSelection:"Wyczyść wybór",
labelDataVisualization:"Wizualizacja danych",stateSelected:"Wybrane",stateUnselected:"Niewybrane",stateMaximized:"Zmaksymalizowane",stateMinimized:"Zminimalizowane",stateExpanded:"Rozwinięte",stateCollapsed:"Zwinięte",stateIsolated:"Izolowane",stateHidden:"Ukryte",stateVisible:"Widoczne",stateDrillable:"Możliwe do drążenia",labelAndValue:"{0}: {1}",labelCountWithTotal:"{0} z {1}"},"oj-ojNavigationList":{defaultRootLabel:"Lista nawigacyjna",hierMenuBtnLabel:'Przycisk "Menu hierarchiczne"',selectedLabel:"wybrane",
previousIcon:"Poprzednia",msgFetchingData:"Pobieranie danych...",msgNoData:"Nie ma żadnych elementów do wyświetlenia.",overflowItemLabel:"Więcej",accessibleReorderTouchInstructionText:"Proszę dwukrotnie stuknąć i przytrzymać. Następnie proszę poczekać na dźwięk, po czym przeciągnąć w celu zmiany uporządkowania.",accessibleReorderBeforeItem:"Przed {item}",accessibleReorderAfterItem:"Po {item}",labelCut:"Wytnij",labelPasteBefore:"Wklej przed",labelPasteAfter:"Wklej po",labelRemove:"Usuń",removeCueText:"Możliwe do usunięcia"},
"oj-ojSlider":{noValue:"ojSlider nie ma wartości",maxMin:"Wartość maksymalna nie może być mniejsza niż minimalna ani jej równa",valueRange:"Wartość musi się zawierać między minimalną a maksymalną",optionNum:"Opcja {option} nie jest liczbą",invalidStep:"Niepoprawny krok; krok musi być > 0"},"oj-ojDialog":{labelCloseIcon:"Zamknięcie"},"oj-ojPopup":{ariaLiveRegionInitialFocusFirstFocusable:"Wchodzenie do okna wyskakującego. Do przechodzenia między oknem wyskakującym a powiązanym formantem proszę używać klawisza F6.",
ariaLiveRegionInitialFocusNone:"Okno wyskakujące otwarte. Do przechodzenia między oknem wyskakującym a powiązanym formantem proszę używać klawisza F6.",ariaLiveRegionInitialFocusFirstFocusableTouch:"Wchodzenie do okna wyskakującego. Okno wyskakujące można zamknąć, przechodząc do ostatniego zawartego w nim łącza.",ariaLiveRegionInitialFocusNoneTouch:"Okno wyskakujące otwarte. Proszę przejść do następnego łącza, aby ustawić fokus w oknie wyskakującym.",ariaFocusSkipLink:"Aby przejść do otwartego okna wyskakującego, proszę dwa razy stuknąć.",
ariaCloseSkipLink:"Aby zamknąć okno wyskakujące, proszę dwa razy stuknąć."},"oj-pullToRefresh":{ariaRefreshLink:"Aby odświeżyć zawartość, proszę uaktywnić łącze",ariaRefreshingLink:"Odświeżanie zawartości",ariaRefreshCompleteLink:"Odświeżanie ukończono"},"oj-ojIndexer":{indexerCharacters:"A|Ą|B|C|Ć|D|E|Ę|F|G|H|I|J|K|L|Ł|M|N|Ń|O|Ó|P|Q|R|S|Ś|T|U|V|W|X|Y|Z|Ż|Ź",indexerOthers:"#",ariaDisabledLabel:"Brak zgodnego nagłówka grupy",ariaOthersLabel:"numer",ariaInBetweenText:"Między {first} a {second}",ariaKeyboardInstructionText:"Aby wybrać wartość, proszę nacisnąć klawisz Enter.",
ariaTouchInstructionText:"Aby przełączyć się do trybu gestów, proszę 2x stuknąć i przytrzymać, a następnie - aby dostosować wartość - przeciągnąć w górę lub w dół."},"oj-ojMenu":{labelCancel:"Anuluj"},"oj-ojColorSpectrum":{labelHue:"Odcień",labelOpacity:"Nieprzezroczystość",labelSatLum:"Nasycenie/luminancja",labelThumbDesc:"Czterokierunkowy suwak po spektrum kolorów."},"oj-ojColorPalette":{labelNone:"Brak"},"oj-ojColorPicker":{labelSwatches:"Próbki",labelCustomColors:"Kolory niestandardowe",labelPrevColor:"Poprzedni kolor",
labelDefColor:"Kolor domyślny",labelDelete:"Usuń",labelDeleteQ:"Usunąć?",labelAdd:"Dodaj",labelAddColor:"Dodaj kolor",labelMenuHex:"HEX",labelMenuRgba:"RGBa",labelMenuHsla:"HSLa",labelSliderHue:"Odcień",labelSliderSaturation:"Nasycenie",labelSliderSat:"Nasyc.",labelSliderLightness:"Średnia biel",labelSliderLum:"Jasność",labelSliderAlpha:"Alfa",labelOpacity:"Nieprzezroczystość",labelSliderRed:"Czerwony",labelSliderGreen:"Zielony",labelSliderBlue:"Niebieski"},"oj-ojFilePicker":{dropzoneText:"Aby wysłać, proszę przeciągnąć pliki tutaj lub kliknąć"},
"oj-ojProgressbar":{ariaIndeterminateProgressText:"W toku"}});