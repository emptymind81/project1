//
//  ViewController.m
//  Dulux
//
//  Created by Alun You on 8/6/13.
//  Copyright (c) 2013 dangdang. All rights reserved.
//

#import "ViewController.h"
#import "DoorsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //self.view.backgroundColor = [UIColor blueColor];
   
   UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
   [self.imageView1 addGestureRecognizer:singleTap];
   
   
}

- (void)viewDidAppear:(BOOL)animated
{
   [super viewDidAppear:animated];
   
   /*CGRect bounds = self.view.bounds;
   CGRect button_rect = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
   UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   button.frame = button_rect;
   [button setTitle:@"Add" forState:UIControlStateNormal];
   //[m_add_relation_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   button.autoresizingMask = UIViewAutoresizingNone;
   [button addTarget:self action:@selector(add_relation:) forControlEvents:UIControlEventTouchUpInside];
   button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
   [self.view addSubview:button];
   
   [UIView animateWithDuration:3.5 animations:^{
      button.alpha = 0.0;
      button.frame = CGRectMake(0, 0,100, 20);
   }];*/
   
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)tapRecognizer {
   
   CGRect bounds = self.view.bounds;
   CGRect image_view_rect = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
   UIImageView* image_view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seri1.png"]];
   image_view.frame = image_view_rect;
   image_view.alpha = 0.0;
   [self.view addSubview:image_view];
   
   [UIView animateWithDuration:0.5
                    animations:^{
                       image_view.alpha = 1.0;
                    }
                    completion:^(BOOL finished){
                       sleep(1);
                       
                       [image_view removeFromSuperview];
                       
                       DoorsViewController* view_controller = [[DoorsViewController alloc] initWithNibName:@"DoorsViewController" bundle:nil];
                       [self.navigationController pushViewController:view_controller animated:false];
                       /*return;
                       
                       [UIView animateWithDuration:0.5 animations:^{
                          image_view.alpha = 0.0;
                       }
                        completion:^(BOOL finished){
                           //[image_view removeFromSuperview];
                           
                           DoorsViewController* view_controller = [[DoorsViewController alloc] initWithNibName:@"DoorsViewController" bundle:nil];
                           [self.navigationController pushViewController:view_controller animated:false];
                        }];*/
                    }];
   
   //DoorsViewController* view_controller = [[DoorsViewController alloc] initWithNibName:@"DoorsViewController" bundle:nil];
   //[self.navigationController pushViewController:view_controller animated:true];
}

@end
