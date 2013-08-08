//
//  DoorsViewController.m
//  Dulux
//
//  Created by You Alun on 8/7/13.
//  Copyright (c) 2013 dangdang. All rights reserved.
//

#import "DoorsViewController.h"
#import "AutoLayoutHelper.h"

@interface DoorsViewController ()

@end

@implementation DoorsViewController
{
   NSMutableArray* m_image_views;
   UIImageView* m_image_view1;
   UIImageView* m_image_view2;
   UIImageView* m_image_view3;
   
   UIImageView* m_icon_image_view;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
   m_icon_image_view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"duluxicon.png"]];
   
   m_image_view1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seri1.png"]];
   m_image_view2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seri2.png"]];
   m_image_view3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seri3.png"]];
   
   m_image_views = [[NSMutableArray alloc] initWithObjects:m_icon_image_view, m_image_view1, m_image_view2, m_image_view3, nil];
   for (int i=0; i<m_image_views.count; i++)
   {
      UIImageView* view = m_image_views[i];
      [self.view addSubview:view];
      view.translatesAutoresizingMaskIntoConstraints = false;
      view.contentMode = UIViewContentModeScaleToFill;
   }
   
   //constraints for icon:
   [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:m_icon_image_view another:self.view attr:NSLayoutAttributeCenterX anotherAttr:NSLayoutAttributeCenterX]];
   [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:m_icon_image_view another:self.view attr:NSLayoutAttributeTop anotherAttr:NSLayoutAttributeTop offset:200]];
   
   //constraints for doors:
   [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:m_image_view1 another:m_image_view2 attr:NSLayoutAttributeWidth]];
   [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:m_image_view1 another:m_image_view2 attr:NSLayoutAttributeHeight]];
   [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:m_image_view1 another:m_image_view3 attr:NSLayoutAttributeWidth]];
   [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:m_image_view1 another:m_image_view3 attr:NSLayoutAttributeHeight]];
   [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:m_image_view1 another:m_image_view2 attr:NSLayoutAttributeBottom]];
   [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:m_image_view1 another:m_image_view3 attr:NSLayoutAttributeBottom]];
   [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:m_image_view2 another:m_image_view1 attr:NSLayoutAttributeLeft anotherAttr:NSLayoutAttributeRight offset:10]];
   [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:m_image_view3 another:m_image_view2 attr:NSLayoutAttributeLeft anotherAttr:NSLayoutAttributeRight offset:10]];
   
   [self.view addConstraint:[AutoLayoutHelper viewOffsetsToAnother:m_image_view1 another:m_icon_image_view attr:NSLayoutAttributeTop anotherAttr:NSLayoutAttributeBottom offset:50]];
   [self.view addConstraint:[AutoLayoutHelper viewEqualsToAnother:m_image_view2 another:self.view attr:NSLayoutAttributeCenterX anotherAttr:NSLayoutAttributeCenterX]];
   //[self.view addConstraint:[AutoLayoutHelper viewEqualsToNumber:m_image_view1 number:100 attr:NSLayoutAttributeWidth]];
   //[self.view addConstraint:[AutoLayoutHelper viewEqualsToNumber:m_image_view2 number:100 attr:NSLayoutAttributeHeight]];

   
   for (int i=0; i<m_image_views.count; i++)
   {
      NSLayoutConstraint* constraint = [[NSLayoutConstraint alloc] init];
   }
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
