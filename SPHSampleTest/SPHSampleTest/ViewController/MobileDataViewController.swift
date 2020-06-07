 import UIKit
 import RSLoadingView

 protocol MobileDataProtocol: class {
    func displayMobileData(viewModel: [MobileDataViewModel])
 }
 class MobileDataViewController: UITableViewController, MobileDataProtocol {
    var interactor: MobileDataDetailsBusinessLogic?
    var router: (NSObjectProtocol & MobileDetailsRoutingLogic & MobileDetailsDataPassing)?
    var postData: [MobileDataViewModel]?
    let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.spinAlone)

    private func setup() {
        let viewController = self
        let interactor = MobileDataInteractor()
        let presenter = MobileDataPresenter()
        let router = MobileDataRouter()
        viewController.interactor = interactor
        viewController.router = router as? (NSObjectProtocol & MobileDetailsDataPassing & MobileDetailsRoutingLogic)
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.tableView.register(MobileDataTableViewCell.nib, forCellReuseIdentifier: MobileDataTableViewCell.reuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        let refreshControl = UIRefreshControl()
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        showOnViewTwins()
        self.fetchMobileData()
        navigationItem.title = "Mobile Data Usage"
        
    }
    func fetchMobileData()  {
        let request = MobileDataModel.Data.Request()
        interactor?.fetchMobileData(request: request)
        refreshControl?.endRefreshing()
    }
    func showOnViewTwins() {
        loadingView.shouldTapToDismiss = true
        loadingView.variantKey = "inAndOut"
        loadingView.speedFactor = 2.0
        loadingView.lifeSpanFactor = 2.0
        loadingView.mainColor = UIColor.green
        loadingView.sizeInContainer = CGSize(width: 100, height: 100)
        loadingView.showOnKeyWindow()
    }
    func displayMobileData(viewModel: [MobileDataViewModel]) {
        postData = viewModel
        DispatchQueue.main.async {
            self.loadingView.hide()
            self.tableView.reloadData()
        }
    }
    
    @objc func refreshData() {
        self.postData?.removeAll()
        tableView.reloadData()
        self.fetchMobileData()
    }
 }
 extension MobileDataViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.postData?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MobileDataTableViewCell.reuseIdentifier, for: indexPath) as? MobileDataTableViewCell  else {
            return UITableViewCell()
        }
        cell.delegate = self
        if let data = self.postData?[indexPath.row] {
            cell.ConfigureCellWithData(data: data)
        }
        return cell
    }
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
 }
 extension MobileDataViewController: MobileDataTableViewCellDelegate {
    func showPopUpWithMessage() {
        let alert = UIAlertController(title: "Alert", message: "Decrease in volume data.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        // topController should now be your topmost view controller
    }
 }
