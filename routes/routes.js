// import express
import express from "express";

// import page controller
import { Index, About, Login, PostLogin, Logout, Register, PostRegister } from "../controllers/page.js";
import { AuthController } from "../controllers/Admin/AuthController.js";
import { ForumController } from "../controllers/ForumController.js";
import { GuideController } from "../controllers/GuideController.js";
import { ProfileController } from "../controllers/ProfileController.js";
import { TourBudgetController } from "../controllers/TourBudgetController.js";

import { DashboardController } from "../controllers/Admin/DashboardController.js";
import { ThreadController } from "../controllers/Admin/ThreadController.js";
import { ThreadCategoryController } from "../controllers/Admin/ThreadCategoryController.js";
import { GuideTourController } from "../controllers/Admin/GuideTourController.js";
import { TourByBudgetController } from "../controllers/Admin/TourByBudgetController.js";
import { SettingController } from "../controllers/Admin/SettingController.js";

// init express router
const router = express.Router();

router.get('/', Index);
router.get('/about', About);
router.get('/register', Register);
router.get('/login', Login);
router.get('/logout', Logout);
router.post('/postlog', PostLogin);
router.post('/postreg', PostRegister);

// Profile Forum
router.get('/profile', ProfileController.index);
router.post('/profile/change-profile', ProfileController.changeProfile);
router.post('/profile/change-password', ProfileController.changePassword);
router.post('/profile/change-photo', ProfileController.changePhoto);

// Route Forum
router.get('/forum', ForumController.find);
router.get('/forum/sub/:id', ForumController.findSub);
router.get('/forum/detail/:id', ForumController.findOne);
router.post('/forum/reply', ForumController.saveReply);

router.get('/forum/create', ForumController.create);
router.post('/forum/save-thread', ForumController.store);

router.get('/forum/my-thread', ForumController.myThread);
router.get('/forum/edit/:id', ForumController.edit);
router.post('/forum/update-thread', ForumController.update);
router.get('/forum/delete/:id', ForumController.destroy);

router.get('/forum/react/:id/:status', ForumController.reaction);
router.get('/forum/reply-react/:id/:status', ForumController.reactionReply);

// Route Tour Budget
router.get('/tour-budget', TourBudgetController.find);
router.get('/tour-budget/sub/:id', TourBudgetController.findSub);


// Route Guide
router.get('/guide', GuideController.index);
router.get('/guide/get-city', GuideController.getCity);
router.get('/guide/get-data', GuideController.getData);
router.get('/guide/detail/:id', GuideController.detail);

// Admin - Auth
router.get('/admin/login', AuthController.login);
router.post('/admin/postlog', AuthController.postLogin);
router.get('/admin/dashboard', DashboardController.index);
router.get('/admin/logout', AuthController.logout);

// Admin - Thread
router.get('/admin/thread', ThreadController.index);
router.get('/admin/thread/delete/:id', ThreadController.destroy);

// Admin - Thread Category
router.get('/admin/thread-category', ThreadCategoryController.index);
router.get('/admin/thread-category/create', ThreadCategoryController.create);
router.post('/admin/thread-category/store', ThreadCategoryController.store);
router.get('/admin/thread-category/edit/:id', ThreadCategoryController.edit);
router.post('/admin/thread-category/update/:id', ThreadCategoryController.update);
router.get('/admin/thread-category/delete/:id', ThreadCategoryController.destroy);

// Admin - Guide Tour
router.get('/admin/guide-tour', GuideTourController.index);
router.get('/admin/guide-tour/create', GuideTourController.create);
router.post('/admin/guide-tour/store', GuideTourController.store);
router.get('/admin/guide-tour/edit/:id', GuideTourController.edit);
router.post('/admin/guide-tour/update/:id', GuideTourController.update);
router.get('/admin/guide-tour/delete/:id', GuideTourController.destroy);

// Admin - Setting
router.get('/admin/setting', SettingController.index);
router.post('/admin/setting/save-about', SettingController.saveAbout);

// Admin - Tour by Budget
router.get('/admin/tour-by-budget', TourByBudgetController.index);
router.get('/admin/tour-by-budget/create', TourByBudgetController.create);
router.post('/admin/tour-by-budget/store', TourByBudgetController.store);
router.get('/admin/tour-by-budget/edit/:id', TourByBudgetController.edit);
router.post('/admin/tour-by-budget/update/:id', TourByBudgetController.update);
router.get('/admin/tour-by-budget/delete/:id', TourByBudgetController.destroy);


// export default router
export default router;