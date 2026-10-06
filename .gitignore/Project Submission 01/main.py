import tkinter as tk
from tkinter import ttk,messagebox
import mysql.connector as mycon
from tkcalendar import DateEntry
from datetime import date

db = mycon.connect(
    host='localhost',
    user='root',
    password='iamironman',
    database='harrisontrust'
)
cur = db.cursor()

root = tk.Tk()
root.title('Harrison Trust')
root.minsize(1000,500)

container = ttk.Frame(root)
container.pack(fill='both',expand=True)
container.rowconfigure(0,weight=1)
container.columnconfigure(0,weight=1)

home_frame = ttk.Frame(container)
regs_frame = ttk.Frame(container)
login_frame = ttk.Frame(container)
admin_frame = ttk.Frame(container)

home_frame.grid(row=0,column=0,sticky='nsew')
regs_frame.grid(row=0,column=0,sticky='nsew')
login_frame.grid(row=0,column=0,sticky='nsew')
admin_frame.grid(row=0,column=0,sticky='nsew')
home_frame.tkraise()

#funcs
def register_donor():

    donor_name = name.get()
    donor_age = age_int.get()
    donor_dob = dob_ent.get_date()
    donor_gender = gender_str.get()
    donor_blood = blood_str.get()
    donor_phone = phone_num.get()
    donor_city = city.get()

    donor_weight = weight_val.get()
    donor_hemo = hemo_val.get()
    donor_sysbp = sys_bp_val.get()
    donor_diasbp = dias_bp_val.get()

    donor_lastDon = last_don_ent.get_date()

    donor_disease = disease_hist.get()
    donor_medic = medication.get()

    def clear_donor_form():
        name.set("")
        age_int.set(0)
        gender_str.set("")
        blood_str.set("")
        phone_num.set("")
        city.set("")
        weight_val.set(0)
        hemo_val.set(0)
        sys_bp_val.set(0)
        dias_bp_val.set(0)
        disease_hist.set(False)
        medication.set(False)
        dob_ent.delete(0, tk.END)
        last_don_ent.delete(0, tk.END)

    today = date.today()

    if donor_dob > today:
        messagebox.showerror(
            "Invalid DOB",
            "Date of birth cannot be in the future."
        )
        return

    calc_age = today.year - donor_dob.year
    if (today.month,today.day) < (donor_dob.month,donor_dob.day):
        calc_age -= 1

    if not donor_phone.isdigit() or len(donor_phone) != 10:
        messagebox.showerror(
            "Invalid Phone Number",
            "Enter a valid 10-digit phone number.")
        return

    def eligible(donor_name, donor_age, calc_age, donor_gender, donor_blood,
             donor_city, donor_weight, donor_hemo, donor_sysbp,
             donor_diasbp, donor_lastDon, donor_disease, donor_medic):

        reasons = []
        if not donor_name.strip():
            reasons.append("Name is required.")

        if donor_age != calc_age:
            reasons.append("Entered age does not match the date of birth.")

        if calc_age < 18:
            reasons.append("Donor must be at least 18 years old.")

        if calc_age > 65:
            reasons.append("Donor must not be older than 65 years.")

        if not donor_gender:
            reasons.append("Gender must be selected.")

        if not donor_blood:
            reasons.append("Blood group must be selected.")

        if not donor_city.strip():
            reasons.append("City is required.")

        if donor_weight < 45:
            reasons.append("Weight must be at least 45 kg.")

        if donor_hemo < 12.5:
            reasons.append("Haemoglobin must be at least 12.5 g/dL.")

        if donor_sysbp < 100 or donor_sysbp > 140:
            reasons.append("Systolic BP must be between 100 and 140 mmHg.")

        if donor_diasbp < 60 or donor_diasbp > 90:
            reasons.append("Diastolic BP must be between 60 and 90 mmHg.")

        today = date.today()
        if donor_lastDon > today:
            reasons.append("Last donation date cannot be in the future.")

        else:
            days_since_donation = (today - donor_lastDon).days

            if donor_gender == "Male":
                required_gap = 90

            elif donor_gender == "Female":
                required_gap = 120

            else:
                required_gap = 120

            if days_since_donation < required_gap:
                reasons.append(
                    f"At least {required_gap} days must have passed since "
                    "the last donation.")

        if donor_disease:
            reasons.append("Donor has a reported disease history.")

        if donor_medic:
            reasons.append("Donor is currently taking medication.")

        if reasons:
            return False, reasons

        return True, []

    is_eligible,reasons = eligible( donor_name,
                                   donor_age,calc_age,
                                   donor_gender,donor_blood,
                                   donor_city,donor_weight,
                                   donor_hemo,donor_sysbp,
                                   donor_diasbp,donor_lastDon,
                                   donor_disease,donor_medic)

    if not is_eligible:
        messagebox.showerror(
        "Donor Not Eligible",
        "The donor cannot be registered for the following reason(s):\n\n"
        + "\n".join("-> " + reason for reason in reasons))
        return

    messagebox.showinfo(
        'Eligible',
        'Donor has passed the eligibility checks')

    cur.execute("""
    SELECT Donor_ID
    FROM donors_general
    WHERE Phone = %s""",
    (donor_phone,))
    
    if cur.fetchone():
        messagebox.showerror(
        "Duplicate Phone Number",
        "This phone number is already registered.")
        return

    query1 = '''
        INSERT INTO donors_general
        (Donor_Name,Age,DOB,Gender,Blood_Group,Phone,City)
        VALUES(%s,%s,%s,%s,%s,%s,%s)'''
    data_dgen = (donor_name,donor_age,
            donor_dob,donor_gender,
            donor_blood,donor_phone,
            donor_city)
    query2 = '''
        INSERT INTO donors_medical
        VALUES (%s, %s, %s, %s, %s, %s)'''
    
    try:
        cur.execute(query1, data_dgen)
        donor_id = cur.lastrowid
        data_dmed = (donor_id, donor_hemo,
                    donor_weight, donor_sysbp,
                    donor_diasbp, donor_lastDon,)
        cur.execute(query2, data_dmed)
        db.commit()

    except mycon.Error as err:
        db.rollback()
        messagebox.showerror(
            "Database Error",
            f"Donor registration failed.\n\n{err}"
        )
        return

    clear_donor_form()

    messagebox.showinfo(
        'Registration Successful',
        f'Donor registered successfully.\nDonor ID: {donor_id}')

def register_recp():
    global r_phone

    r_name = recp_name.get()
    r_age = recp_age.get()
    r_dob = recp_dob_ent.get_date()
    r_gender = recp_gender.get()
    r_blood = recp_blood.get()
    r_phone = recp_phone.get()

    r_condition = recp_condition.get()
    r_urgency = recp_urgency.get()
    r_units = recp_units.get()

    def clear_recp_form():
        recp_name.set("")
        recp_age.set(0)
        recp_gender.set("")
        recp_blood.set("")
        recp_phone.set("")
        recp_condition.set("")
        recp_urgency.set("")
        recp_units.set(0)
        recp_dob_ent.delete(0, tk.END)

    today = date.today()

    calc_age = today.year - r_dob.year
    if (today.month,today.day) < (r_dob.month,r_dob.day):
            calc_age -= 1

    if r_dob > today:
        messagebox.showerror(
            "Invalid DOB",
            "Date of birth cannot be in the future.")
        return
    
    if calc_age != r_age:
        messagebox.showerror(
            'Age Not Matched',
            'Entered age does not match date of birth.')
        return
    
    if not r_phone.isdigit() or len(r_phone) != 10:
        messagebox.showerror(
            "Invalid Phone Number",
            "Enter a valid 10-digit phone number.")
        return

    if r_units <= 0:
        messagebox.showerror(
            "Invalid Units",
            "Units required must be greater than 0.")
        return

    def empty(r_name,r_gender,r_blood,r_condition,r_urgency):
        reasons = []
        if not r_name.strip():
            reasons.append("Name is required.")
        if not r_gender:
            reasons.append("Gender must be selected.")
        if not r_blood:
            reasons.append("Blood group must be selected.")
        if not r_condition:
            reasons.append('Condition must be selected.')
        if not r_urgency:
            reasons.append('Urgency must be selected.')
        

        if reasons:
            return False,reasons

        return True, []

    is_empty,reasons = empty(r_name,r_gender,r_blood,r_condition,r_urgency)
    if not is_empty:
       messagebox.showerror(
              "Form Incomplete",
              "The recipient cannot be registered for the following reason(s):\n\n"
              + "\n".join("-> " + reason for reason in reasons))
       return

    cur.execute("""
    SELECT Donor_ID
    FROM donors_general
    WHERE Phone = %s
""", (r_phone,))
    
    if cur.fetchone():
        messagebox.showerror(
        "Duplicate Phone Number",
        "This phone number is already registered.")
        return
    
    cur.execute("""
    SELECT Recipient_ID
    FROM recipients_general
    WHERE Phone = %s""", 
    (r_phone,))
    
    if cur.fetchone():
        messagebox.showerror(
        "Duplicate Phone Number",
        "This phone number is already registered.")
        return

    query1 = '''
        INSERT INTO recipients_general
        (Recipient_Name,Age,DOB,Gender,Blood_Group,Phone)
        VALUES(%s,%s,%s,%s,%s,%s)'''
    data_rgen = (r_name,r_age,
                 r_dob,r_gender,
                 r_blood,r_phone)
    query2 = '''
        INSERT INTO recipients_medical
        VALUES(%s,%s,%s,%s)'''
   
    try:
        cur.execute(query1,data_rgen)
        recp_id = cur.lastrowid
        data_rmed = (recp_id,r_condition,
                    r_urgency,r_units)
        cur.execute(query2,data_rmed)
        db.commit()

    except mycon.Error as err:
         db.rollback()
         messagebox.showerror(
            "Database Error",
            f"Recipient registration failed.\n\n{err}")
         return

    clear_recp_form()
        
    messagebox.showinfo(
        'Registration Successful',
        f'Recipient registered successfully.\nRecipient ID: {recp_id}')


def grid6x6(frame):
    for i in range(6):
        frame.rowconfigure(i,weight=1)
        frame.columnconfigure(i,weight=1)

def open_donor_regs():
    global name, age_int, dob, dob_ent, gender_str, blood_str
    global phone_num, city, weight_val, hemo_val
    global sys_bp_val, dias_bp_val, last_don_ent
    global disease_hist, medication, donor_subframe, recp_subframe

    # Only one registration form should exist at a time.
    if 'recp_subframe' in globals() and recp_subframe.winfo_exists():
        recp_subframe.destroy()

    if 'donor_subframe' in globals() and donor_subframe.winfo_exists():
        donor_subframe.destroy()

    donor_subframe = ttk.Frame(
        regs_frame,borderwidth=3,
        relief='solid')
    donor_subframe.grid(
        row=1,column=3,rowspan=4,
        columnspan=3,sticky='news',
        padx=10,pady=10)

    donor_subframe.columnconfigure((0,2,4),weight=1)
    donor_subframe.columnconfigure((1,3,5),weight=2)

    donor_subframe.rowconfigure(0,weight=2)
    donor_subframe.rowconfigure((1,2,3,4,5),weight=1)
    donor_subframe.rowconfigure(6,weight=2)

#Form Title
    d_header = ttk.Label(
        donor_subframe,
        text='Donor Registration',
        font=('Calibri', 30, 'bold'),
        anchor='center')

    d_header.grid(
        row=0,column=0,
        columnspan=6,sticky='nsew')

#Name
    name_label = ttk.Label(
        donor_subframe,
        text='Name')
    name_label.grid(
        row=1,column=0,sticky='e',
        padx=5,pady=5)

    name = tk.StringVar()
    name_ent = ttk.Entry(donor_subframe,
                         textvariable = name)
    name_ent.grid(row=1,column=1,sticky='ew',
                  padx=5,pady=5)

#Gender 
    gender_label = ttk.Label(
        donor_subframe,
        text='Gender')
    gender_label.grid(
        row=1,column=2,
        sticky='e',padx=5,pady=5)
    
    genders = ('Male', 'Female', 'Other')
    gender_str = tk.StringVar()
    gender_box = ttk.Combobox(
        donor_subframe,
        textvariable=gender_str,
        values=genders,
        state='readonly')
    gender_box.grid(
        row=1,column=3,sticky='ew',
        padx=5,pady=5)

#Blood Group
    blood_label = ttk.Label(
        donor_subframe,
        text='Blood Group')
    blood_label.grid(
        row=1,column=4,sticky='e',
        padx=5,pady=5)

    blood_groups = ('A+','A-',
                    'B+','B-',
                    'AB+','AB-',
                    'O+','O-')
    blood_str = tk.StringVar()
    blood_box = ttk.Combobox(
      donor_subframe,
      textvariable=blood_str,
      values=blood_groups,
      state='readonly')
    blood_box.grid(
        row=1,column=5,sticky='ew',
        padx=5,pady=5)

#Age
    age_label = ttk.Label(
        donor_subframe,
        text='Age')
    age_label.grid(
       row=2,column=0,sticky='e',
       padx=5,pady=5)

    age_int = tk.IntVar()
    age_box = ttk.Spinbox(
        donor_subframe,from_=18,
        to=122,textvariable=age_int)
    age_box.grid(
        row=2,column=1,sticky='ew',
        padx=5,pady=5)

#DOB
    dob_label = ttk.Label(
        donor_subframe,
        text='DOB')
    dob_label.grid(
        row=2,column=2,sticky='e',
        padx=5,pady=5)

    dob = tk.StringVar()
    dob_ent = DateEntry(
        donor_subframe,
        date_pattern='yyyy/mm/dd',
        textvariable=dob)
    dob_ent.grid(
        row=2,column=3,sticky='ew',
        padx=5,pady=5)

#Phone Number
    def validate_phone(value):
        return value == "" or (value.isdigit() and len(value) <= 10)
    phone_validation = root.register(validate_phone)

    phone_label = ttk.Label(
        donor_subframe,
        text='Phone')
    phone_label.grid(
        row=4,column=0,sticky='e',
        padx=5,pady=5)

    phone_num = tk.StringVar()
    phone_ent = ttk.Entry(
        donor_subframe,
        validate='key',
        validatecommand=(phone_validation,'%P'),
        textvariable=phone_num)
    phone_ent.grid(
        row=4,column=1,sticky='ew',
        padx=5,pady=5)

#City
    city_label = ttk.Label(
        donor_subframe,
        text='City')
    city_label.grid(
        row=3,column=0,sticky='e',
        padx=5,pady=5)
    
    city = tk.StringVar()
    city_ent = ttk.Entry(
        donor_subframe,
        textvariable=city)
    city_ent.grid(
        row=3,column=1,sticky='ew',
        padx=5,pady=5)

#Weight    
    weight_label = ttk.Label(
        donor_subframe,
        text='Weight (kg)')
    weight_label.grid(
        row=4,column=2,sticky='e',
        padx=5,pady=5)

    weight_val = tk.DoubleVar()
    weight_box = ttk.Spinbox(
        donor_subframe,
        from_=35.0,
        to=200.0,
        increment=0.1,
        textvariable=weight_val)

    weight_box.grid(
        row=4,column=3,sticky='ew',
        padx=5,pady=5)

#Last Donated
    last_don_label = ttk.Label(
        donor_subframe,
        text='Last Donation')
    last_don_label.grid(
        row=3,column=2,sticky='e',
        padx=5,pady=5)

    last_donated = tk.StringVar()
    last_don_ent = DateEntry(
        donor_subframe,
        date_pattern='yyyy/mm/dd',
        textvariable=last_donated)
    last_don_ent.grid(
        row=3,column=3,sticky='ew',
        padx=5,pady=5)

#Hemoglobin
    hemo_label = ttk.Label(
        donor_subframe,
        text='Haemoglobin')
    hemo_label.grid(
        row=2,column=4,sticky='e',
        padx=5,pady=5)

    hemo_val = tk.DoubleVar()
    hemo_box = ttk.Spinbox(
        donor_subframe,
        from_=10.0,
        to=26.0,
        increment=0.1,
        textvariable=hemo_val)
    hemo_box.grid(
        row=2,column=5,sticky='ew',
        padx=5,pady=5)

#Systolic BP
    sysbp_label = ttk.Label(
        donor_subframe,
        text='Systolic BP')
    sysbp_label.grid(
        row=3,column=4,sticky='e',
        padx=5,pady=5)

    sys_bp_val = tk.IntVar()
    sysbp_box = ttk.Spinbox(
        donor_subframe,
        from_=50,
        to=300,
        textvariable=sys_bp_val)
    sysbp_box.grid(
        row=3,column=5,sticky='ew',
        padx=5,pady=5)

#Disease History
    disease_hist = tk.BooleanVar()
    disease_check = ttk.Checkbutton(
        donor_subframe,
        text='Existing Disease History',
        variable=disease_hist)
    disease_check.grid(
        row=5,column=4,columnspan=2,
        sticky='w',padx=5,pady=5)

#Medication
    medication = tk.BooleanVar()
    medic_check = ttk.Checkbutton(
        donor_subframe,
        text='Existing Medications',
        variable=medication)
    medic_check.grid(
        row=5,column=1,columnspan=2,
        sticky='w',padx=5,pady=5)

#Diastolic BP
    diasbp_label = ttk.Label(
        donor_subframe,
        text='Diastolic BP')
    diasbp_label.grid(
        row=4,column=4,sticky='e',
        padx=5,pady=5)
    
    dias_bp_val = tk.IntVar()
    dias_bp_box = ttk.Spinbox(
        donor_subframe,
        from_=30,
        to=200,
        textvariable=dias_bp_val)
    dias_bp_box.grid(
        row=4,column=5,sticky='ew',
        padx=5,pady=5)

    submit_btn = ttk.Button(
        donor_subframe,
        text='Submit',
        command=register_donor)
    submit_btn.grid(
        row=6,column=2,
        columnspan=2,pady=15)
    

def open_recp_regs():
    global recp_subframe, donor_subframe
    global recp_name, recp_age, recp_dob, recp_dob_ent
    global recp_gender, recp_blood, recp_phone
    global recp_condition, recp_urgency, recp_units

    # Remove the donor form before creating the recipient form.
    if 'donor_subframe' in globals() and donor_subframe.winfo_exists():
        donor_subframe.destroy()

    if 'recp_subframe' in globals() and recp_subframe.winfo_exists():
        recp_subframe.destroy()

    recp_subframe = ttk.Frame(regs_frame, borderwidth=3, relief='solid')
    recp_subframe.grid(row=1, column=3, rowspan=5, columnspan=3,
                       sticky='news', padx=10, pady=10)

    recp_subframe.columnconfigure((0, 2, 4), weight=1)
    recp_subframe.columnconfigure((1, 3, 5), weight=2)
    recp_subframe.rowconfigure(0, weight=2)
    recp_subframe.rowconfigure((1, 2, 3), weight=1)
    recp_subframe.rowconfigure(4, weight=2)

    r_header = ttk.Label(recp_subframe, text='Recipient Registration',
                         font=('Calibri', 30, 'bold'), anchor='center')
    r_header.grid(row=0, column=0, columnspan=6, sticky='nsew')

    ttk.Label(recp_subframe, text='Name').grid(
        row=1, column=0, sticky='e', padx=5, pady=5)
    recp_name = tk.StringVar()
    ttk.Entry(recp_subframe, textvariable=recp_name).grid(
        row=1, column=1, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Gender').grid(
        row=1, column=2, sticky='e', padx=5, pady=5)
    recp_gender = tk.StringVar()
    ttk.Combobox(recp_subframe, textvariable=recp_gender,
                 values=('Male', 'Female', 'Other'),
                 state='readonly').grid(
        row=1, column=3, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Blood Group').grid(
        row=1, column=4, sticky='e', padx=5, pady=5)
    recp_blood = tk.StringVar()
    ttk.Combobox(recp_subframe, textvariable=recp_blood,
                 values=('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
                 state='readonly').grid(
        row=1, column=5, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Age').grid(
        row=2, column=0, sticky='e', padx=5, pady=5)
    recp_age = tk.IntVar(value=0)
    ttk.Spinbox(recp_subframe, from_=0, to=122,
                textvariable=recp_age).grid(
        row=2, column=1, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='DOB').grid(
        row=2, column=2, sticky='e', padx=5, pady=5)
    recp_dob = tk.StringVar()
    recp_dob_ent = DateEntry(recp_subframe, date_pattern='yyyy/mm/dd',
                             textvariable=recp_dob)
    recp_dob_ent.grid(row=2, column=3, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Phone').grid(
        row=2, column=4, sticky='e', padx=5, pady=5)

    def validate_recipient_phone(value):
        return value == "" or (value.isdigit() and len(value) <= 10)

    recipient_phone_validation = root.register(validate_recipient_phone)
    recp_phone = tk.StringVar()
    ttk.Entry(
        recp_subframe,
        validate='key',
        validatecommand=(recipient_phone_validation, '%P'),
        textvariable=recp_phone
    ).grid(row=2, column=5, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Condition').grid(
        row=3, column=0, sticky='e', padx=5, pady=5)
    recp_condition = tk.StringVar()
    ttk.Combobox(recp_subframe, textvariable=recp_condition,
                 values=('Critical', 'Normal'),
                 state='readonly').grid(
        row=3, column=1, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Urgency').grid(
        row=3, column=2, sticky='e', padx=5, pady=5)
    recp_urgency = tk.StringVar()
    ttk.Combobox(recp_subframe, textvariable=recp_urgency,
                 values=('High', 'Medium', 'Low'),
                 state='readonly').grid(
        row=3, column=3, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Units Required').grid(
        row=3, column=4, sticky='e', padx=5, pady=5)
    recp_units = tk.IntVar(value=1)
    ttk.Spinbox(recp_subframe, from_=1, to=99999999999,
                textvariable=recp_units).grid(
        row=3, column=5, sticky='ew', padx=5, pady=5)

    submit_btn = ttk.Button(
        recp_subframe,
        text='Submit',
        command=register_recp)
    submit_btn.grid(
        row=6,column=2,
        columnspan=2,pady=15)


#home page

grid6x6(home_frame)
home_title = ttk.Label(
    home_frame,
    text='Harrison Trust',
    font=('Impact',96,'bold'),
    anchor='center'
    )
home_title.grid(
    row=0,column=0,columnspan=6,
    sticky='nswe',pady=20)

regs_btn = ttk.Button(
    home_frame,
    text='Registration',
    command= lambda: regs_frame.tkraise())
regs_btn.grid(
    row=2,column=2,rowspan=2,
    sticky='nsew',padx=20,pady=10)

admin_btn = ttk.Button(
    home_frame,
    text='Admin',
    command=lambda: login_frame.tkraise())
admin_btn.grid(
    row=2,column=3,rowspan=2,
    sticky='nsew',padx=20,pady=10)

#user page


grid6x6(regs_frame)
back_btn = ttk.Button(
    regs_frame,
    text='Back',
    command=lambda:home_frame.tkraise())
back_btn.place(x=50,y=50)

donor_btn = ttk.Button(
    regs_frame,
    text='Donor Registration',
    command=open_donor_regs)
donor_btn.grid(row=2,column=1,
               sticky='news',padx=10,pady=10)

recp_btn = ttk.Button(
    regs_frame,
    text='Recepient Registration',
    command=open_recp_regs)
recp_btn.grid(row=3,column=1,
              sticky='news',padx=10,pady=10)
#donor regs

#recp regs

#admin login

grid6x6(login_frame)
back_btn = ttk.Button(
    login_frame,
    text='Back',
    command=lambda:home_frame.tkraise())
back_btn.place(x=50,y=50)

login_subframe = ttk.Frame(
    login_frame,
    borderwidth=5,
    relief='solid')
login_subframe.grid(
    row=1,column=1,
    rowspan=4,columnspan=4,
    sticky='nsew',padx=40,pady=30)
#donor recs

#recp recs

#inventory

root.mainloop()