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
{
    NSMutableArray* m_image_views;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //self.view.backgroundColor = [UIColor blueColor];
    
    m_image_views = [[NSMutableArray alloc] initWithObjects:self.imageView1, self.imageView2, self.imageView3, self.imageView4, nil];
    for (int i=0; i<m_image_views.count; i++)
    {
        UIImageView* view = m_image_views[i];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [view addGestureRecognizer:singleTap];
    }
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

- (void) switchToDoorsViewController:(int)seriIndex flashImageName:(NSString*)flashImageName
{
    CGRect bounds = self.view.bounds;
    CGRect image_view_rect = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    UIImageView* image_view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:flashImageName]];
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
                         view_controller.seriIndex = seriIndex;
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

- (void)handleTap:(UITapGestureRecognizer *)tapRecognizer {
   
    for (int i=0; i<m_image_views.count; i++)
    {
        UIImageView* view = m_image_views[i];
        if (view == tapRecognizer.view)
        {
            NSString* flash_image_name = [NSString stringWithFormat:@"%@%d", @"seri", i+1];
            [self switchToDoorsViewController:i flashImageName:flash_image_name];
        }
    }
}

@end
