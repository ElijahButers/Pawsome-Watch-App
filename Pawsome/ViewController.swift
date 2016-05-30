/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSizeMake(100, 100)
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20)
    collectionView.collectionViewLayout = layout
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  // MARK: - UICollectionViewDataSource
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell: CatPhotoCell = collectionView.dequeueReusableCellWithReuseIdentifier("CatCell", forIndexPath: indexPath) as! CatPhotoCell
    let catImageName = String(format: "cat%02d", arguments: [indexPath.row + 1])
    cell.imageView.image = UIImage(named: catImageName)
    return cell
  }
  
  // MARK: - Segue
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "PhotoViewerSegue" {
      if let photoViewer = segue.destinationViewController as? PhotoViewController, let cell = sender as? CatPhotoCell {
        photoViewer.image = cell.imageView.image
        
      }
    }
  }
  
}

